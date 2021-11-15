//
//  AppView.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/11/10.
//

import SwiftUI
import ComposableArchitecture
import Introspect

// MARK: - Search feature domain
struct SearchState: Equatable {
  var locations: [Location] = []
  var locationWeather: LocationWeather?
  var locationWeatherRequestInFlight: Location?
  var searchQuery = ""
}

enum SearchAction: Equatable {
  case locationsResponse(Result<[Location], WeatherClient.Failure>)
  case locationTapped(Location)
  case locationWeatherResponse(Result<LocationWeather, WeatherClient.Failure>)
  case searchQueryChanged(String)
}

struct SearchEnvironment {
  var weatherClient: WeatherClient
  var mainQueue: AnySchedulerOf<DispatchQueue>
}

// MARK: - Search feature reducer
let searchReducer = Reducer<SearchState, SearchAction, SearchEnvironment> {
  state, action, environment in
  switch action {
  case .locationsResponse(.failure):
    state.locations = []
    return .none

  case let .locationsResponse(.success(response)):
    state.locations = response
    return .none

  case let .locationTapped(location):
    struct SearchWeatherId: Hashable {}

    state.locationWeatherRequestInFlight = location

    return environment.weatherClient
      .weather(location.id)
      .receive(on: environment.mainQueue)
      .catchToEffect(SearchAction.locationWeatherResponse)
      .cancellable(id: SearchWeatherId(), cancelInFlight: true)

  case let .searchQueryChanged(query):
    struct SearchLocationId: Hashable {}

    state.searchQuery = query

    // When the query is cleared we can clear the search results, but we have to make sure to cancel
    // any in-flight search requests too, otherwise we may get data coming in later.
    guard !query.isEmpty else {
      state.locations = []
      state.locationWeather = nil
      return .cancel(id: SearchLocationId())
    }

    return environment.weatherClient
      .searchLocation(query)
      .debounce(id: SearchLocationId(), for: 0.3, scheduler: environment.mainQueue)
      .catchToEffect(SearchAction.locationsResponse)

  case let .locationWeatherResponse(.failure(locationWeather)):
    state.locationWeather = nil
    state.locationWeatherRequestInFlight = nil
    return .none

  case let .locationWeatherResponse(.success(locationWeather)):
    state.locationWeather = locationWeather
    state.locationWeatherRequestInFlight = nil
    return .none
  }
}

// MARK: - AppView
struct AppView: View {
  let store: Store<SearchState, SearchAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      NavigationView {
        VStack(alignment: .leading) {
          List {
            ForEach(viewStore.locations, id: \.id) { location in
              VStack(alignment: .leading) {
                Button(action: { viewStore.send(.locationTapped(location)) }) {
                  HStack {
                    Text(location.title)

                    if viewStore.locationWeatherRequestInFlight?.id == location.id {
                      ProgressView()
                    }
                  }
                }

                if location.id == viewStore.locationWeather?.id {
                  self.weatherView(locationWeather: viewStore.locationWeather)
                }
              }
            }
          }
          HStack {
            Image(systemName: "magnifyingglass")
            TextField(
              "New York, San Francisco, ...",
              text: viewStore.binding(
                get: \.searchQuery, send: SearchAction.searchQueryChanged)
            )
              .introspectTextField { textField in
                  textField.becomeFirstResponder()
              }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .disableAutocorrection(true)
          }
          .padding([.leading, .trailing], 16)
        }
        .navigationBarTitle("Search")
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }

  func weatherView(locationWeather: LocationWeather?) -> some View {
    guard let locationWeather = locationWeather else {
      return AnyView(EmptyView())
    }

    let days = locationWeather.consolidatedWeather
      .enumerated()
      .map { idx, weather in formattedWeatherDay(weather, isToday: idx == 0) }

    return AnyView(
      VStack(alignment: .leading) {
        ForEach(days, id: \.self) { day in
          Text(day)
        }
      }
      .padding([.leading], 16)
    )
  }
}

// MARK: - Private helpers
private func formattedWeatherDay(_ data: LocationWeather.ConsolidatedWeather, isToday: Bool)
  -> String
{
  let date =
    isToday
    ? "Today"
    : dateFormatter.string(from: data.applicableDate).capitalized

  return [
    date,
    "\(Int(round(data.theTemp)))℃",
    data.weatherStateName,
  ]
  .compactMap { $0 }
  .joined(separator: ", ")
}

private let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "EEEE"
  return formatter
}()

// MARK: - SwiftUI previews
struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    let store = Store(
      initialState: SearchState(),
      reducer: searchReducer,
      environment: SearchEnvironment(
        weatherClient: WeatherClient(
          searchLocation: { _ in
            Effect(value: [
              Location(id: 1, title: "Brooklyn"),
              Location(id: 2, title: "Los Angeles"),
              Location(id: 3, title: "San Francisco"),
            ])
          },
          weather: { id in
            Effect(
              value: LocationWeather(
                consolidatedWeather: [
                  .init(
                    applicableDate: Date(timeIntervalSince1970: 0),
                    maxTemp: 90,
                    minTemp: 70,
                    theTemp: 80,
                    weatherStateName: "Clear"
                  ),
                  .init(
                    applicableDate: Date(timeIntervalSince1970: 86_400),
                    maxTemp: 70,
                    minTemp: 50,
                    theTemp: 60,
                    weatherStateName: "Rain"
                  ),
                  .init(
                    applicableDate: Date(timeIntervalSince1970: 172_800),
                    maxTemp: 100,
                    minTemp: 80,
                    theTemp: 90,
                    weatherStateName: "Cloudy"
                  ),
                ],
                id: id
              ))
          }),
        mainQueue: .main
      )
    )

    return Group {
      AppView(store: store)

      AppView(store: store)
        .environment(\.colorScheme, .dark)
    }
  }
}
