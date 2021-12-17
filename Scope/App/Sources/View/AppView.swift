//
//  AppView.swift
//  Application_iOS
//
//  Created by 조요한 on 2021/11/10.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Scopes

//enum Scopes: String, CaseIterable, Equatable {
//  case home
//  case weatherClient
//}

// MARK: - Search feature domain
//struct SearchState: Equatable {
//  var searchText = ""
//  var scopes: [String] = Scopes.allCases.map { $0.rawValue }
//  var scopeTitle: String = "Scope"
//  var locations: [Location] = []
//  var locationWeather: LocationWeather?
//  var locationWeatherRequestInFlight: Location?
//  var searchQuery = ""
//  var isCommited: Scopes = .home
//}

//enum SearchAction: Equatable {
//  case locationTapped(Location)
//  case searchQueryChanged(String)
//  case locationWeatherResponse(Result<LocationWeather, Failure>)
//  case locationsResponse(Result<[Location], Failure>)
//  case commitScope(Scopes)
//}

//struct SearchEnvironment {
//  var weatherClient: WeatherClient
//  var mainQueue: AnySchedulerOf<DispatchQueue>
//}

// MARK: - Search feature reducer
//let searchReducer = Reducer<SearchState, SearchAction, SearchEnvironment> {
//  state, action, environment in
//  switch action {
//  case .locationsResponse(.failure):
//    state.locations = []
//    return .none
//
//  case let .locationsResponse(.success(response)):
//    state.locations = response
//    return .none
//
//  case let .locationTapped(location):
//    struct SearchWeatherId: Hashable {}
//
//    state.locationWeatherRequestInFlight = location
//
//    return environment.weatherClient
//      .weather(location.id)
//      .receive(on: environment.mainQueue)
//      .catchToEffect(SearchAction.locationWeatherResponse)
//      .cancellable(id: SearchWeatherId(), cancelInFlight: true)
//
//  case let .searchQueryChanged(query):
//
//    state.searchQuery = query
//
//    switch state.isCommited {
//    case .home:
//      if query.isEmpty {
//        state.scopes = Scopes.allCases.map { $0.rawValue }
//      } else {
//        state.scopes = Scopes.allCases.map { $0.rawValue }
//        state.scopes = state.scopes.filter { $0.lowercased().contains(query.lowercased()) }
//      }
//      state.scopeTitle = state.scopes.first ?? String()
//      return .none
//    case .weatherClient:
//      struct SearchLocationId: Hashable {}
//      guard !query.isEmpty else {
//        state.locations = []
//        state.locationWeather = nil
//        return .cancel(id: SearchLocationId())
//      }
//
//      return environment.weatherClient
//        .searchLocation(query)
//        .debounce(id: SearchLocationId(), for: 0.3, scheduler: environment.mainQueue)
//        .catchToEffect(SearchAction.locationsResponse)
//    }
//
//  case let .locationWeatherResponse(.failure(locationWeather)):
//    state.locationWeather = nil
//    state.locationWeatherRequestInFlight = nil
//    return .none
//
//  case let .locationWeatherResponse(.success(locationWeather)):
//    state.locationWeather = locationWeather
//    state.locationWeatherRequestInFlight = nil
//    return .none
//
//  case .commitScope(let scope):
//    state.isCommited = scope
//    return .none
//  }
//}

//struct WeatherClientView: View {
//  let store: Store<SearchState, SearchAction>
//
//  var body: some View {
//    WithViewStore(store) { viewStore in
//      if viewStore.isCommited == .weatherClient {
//        List {
//          ForEach(viewStore.locations, id: \.id) { location in
//            VStack(alignment: .leading) {
//              Button(action: { viewStore.send(.locationTapped(location)) }) {
//                HStack {
//                  Text(location.title)
//
//                  if viewStore.locationWeatherRequestInFlight?.id == location.id {
//                    ProgressView()
//                  }
//                }
//              }
//
//              if location.id == viewStore.locationWeather?.id {
//                self.weatherView(locationWeather: viewStore.locationWeather)
//              }
//            }
//          }
//        }
//      }
//    }
//  }
//
//  func weatherView(locationWeather: LocationWeather?) -> some View {
//    guard let locationWeather = locationWeather else {
//      return AnyView(EmptyView())
//    }
//
//    let days = locationWeather.consolidatedWeather
//      .enumerated()
//      .map { idx, weather in formattedWeatherDay(weather, isToday: idx == 0) }
//
//    return AnyView(
//      VStack(alignment: .leading) {
//        ForEach(days, id: \.self) { day in
//          Text(day)
//        }
//      }
//        .padding([.leading], 16)
//    )
//  }
//}

struct HomeView: View {
  let store: Store<HomeState, HomeAction>
  
  init(store: Store<HomeState, HomeAction>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(store) { viewStore in
      List(viewStore.allCase, id: \.self) { scope in
        Text(scope.uppercased())
      }
    }
  }
}

struct WeatherClientView: View {
  let store: Store<WeatherClientState, WeatherClientAction>
  
  init(store: Store<WeatherClientState, WeatherClientAction>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Text("weather client")
    }
  }
}

// MARK: - AppView
struct AppView: View {
  let store: Store<AppState, AppAction>
  
  init(store: Store<AppState, AppAction>) {
    self.store = store
  }
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        ZStack {
          VStack(alignment: .leading, spacing: .zero) {
            SwitchStore(store.scope(state: \.scope)) {
              CaseLet(state: /AppState.Scope.home, action: AppAction.home, then: HomeView.init(store:))
              CaseLet(state: /AppState.Scope.weatherClient, action: AppAction.weatherClient, then: WeatherClientView.init(store:))
            }
          }
          .edgesIgnoringSafeArea(.bottom)
          
          VStack {
            Spacer()
            
            if viewStore.isSearchBarHidden {
              Rectangle().fill(Color.black).frame(height: 1)
              HStack {
                Spacer()
                Label(title: {
                  Text("다시 검색")
                    .font(.system(size: 10, weight: .light))
                }, icon: {
                  Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color.black)
                })
                Spacer()
              }
              .background(.thinMaterial)
              .edgesIgnoringSafeArea(.bottom)
              .onTapGesture {
                viewStore.send(.set(\.$isSearchBarHidden, false))
              }
            } else {
              HStack {
                Menu {
                  Button {
                    viewStore.send(.set(\.$isSearchBarHidden, true))
                  } label: {
                    Label(title: {
                      Text("전체 화면으로 탐색")
                    }, icon: {
                      Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .foregroundColor(Color.white)
                    })
                  }
                } label: {
                  Image(systemName: "option")
                    .foregroundColor(Color.white)
                }
                
                TextField(
                  "원하는 스코프를 입력하세요",
                  text: viewStore.binding(\.$searchQuery),
                  onCommit: {
                    
                  }
                )
                //                  .introspectTextField { textField in
                //                    textField.becomeFirstResponder()
                //                  }
                //                  .autocapitalization(.none)
                  .disableAutocorrection(true)
                  .foregroundColor(Color.white)
                //                  .multilineTextAlignment(.center)
                
                Button {
                  print("commit action")
                } label: {
                  Image(systemName: "return")
                    .foregroundColor(Color.white)
                }
              }
              .padding()
              .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
              .padding(.horizontal, 20)
              .padding(.vertical, 10)
              .background(.thinMaterial)
              .frame(
                width: UIScreen.main.bounds.width,
                height: 70
              )
            }
          }
        }
        .navigationTitle("⌗ " + viewStore.searchQuery)
        .toolbar(content: toolbarView)
      }
      .onAppear {
        viewStore.send(.onAppear)
      }
    }
  }
  
  func toolbarView() -> some View {
    Button {
      print("tollbar action")
    } label: {
      Label("Settings", systemImage: "gearshape")
        .foregroundColor(Color.black)
    }
  }
  //
  //    .onAppear {
  //      viewStore.send(.searchQueryChanged(""))
  //    }
  
  
  //  let store: Store<SearchState, SearchAction>
  //
  //  var body: some View {
  //    WithViewStore(store) { viewStore in
  //      NavigationView {
  //        VStack(alignment: .leading) {
  //
  //          if viewStore.isCommited == .home {
  //            List(viewStore.scopes.filter{$0.hasPrefix(viewStore.searchText)}, id: \.self) { scope in
  //              Text(scope)
  //            }
  //          }
  //
  //          WeatherClientView(store: store)
  //
  //          HStack {
  //            TextField(
  //              viewStore.scopeTitle != Scopes.home.rawValue ? "스코프를 재설정 하시려면 home을 입력해 주세요." : "원하는 스코프를 정해주세요.",
  //              text: viewStore.binding(
  //                get: \.searchQuery,
  //                send: SearchAction.searchQueryChanged),
  //              onCommit:  {
  //                switch viewStore.isCommited {
  //                case .home:
  //                  viewStore.send(.commitScope(Scopes(rawValue: viewStore.scopes.first ?? "home") ?? .home))
  //                case .weatherClient:
  //                  if viewStore.searchQuery == Scopes.home.rawValue {
  //                    viewStore.send(.commitScope(.home))
  //                  }
  //                }
  //                viewStore.send(.searchQueryChanged(String()))
  //              }
  //            )
  //              .introspectTextField { textField in
  //                textField.becomeFirstResponder()
  //              }
  //              .textFieldStyle(RoundedBorderTextFieldStyle())
  //              .autocapitalization(.none)
  //              .disableAutocorrection(true)
  //          }
  //          .padding([.leading, .trailing], 16)
  //        }
  //        .navigationTitle("# " + viewStore.scopeTitle)
  //      }
  //      .navigationViewStyle(StackNavigationViewStyle())
  //    }
  //  }
}

// MARK: - AppView
//struct AppView: View {
//  let store: Store<SearchState, SearchAction>
//
//  var body: some View {
//    WithViewStore(store) { viewStore in
//      NavigationView {
//        VStack(alignment: .leading, spacing: .zero) {
//
//          if viewStore.isCommited == .home {
//            List(viewStore.scopes.filter{$0.hasPrefix(viewStore.searchText)}, id: \.self) { scope in
//              Text(scope)
//            }
//          }
//
//          WeatherClientView(store: store)
//
//          HStack {
//            TextField(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
//              viewStore.scopeTitle != Scopes.home.rawValue ? "스코프를 재설정 하시려면 home을 입력해 주세요." : "원하는 스코프를 정해주세요.",
//              text: viewStore.binding(
//                get: \.searchQuery,
//                send: SearchAction.searchQueryChanged),
//              onCommit:  {
//                switch viewStore.isCommited {
//                case .home:
//                  viewStore.send(.commitScope(Scopes(rawValue: viewStore.scopes.first ?? "home") ?? .home))
//                case .weatherClient:
//                  if viewStore.searchQuery == Scopes.home.rawValue {
//                    viewStore.send(.commitScope(.home))
//                  }
//                case .github:
//                  return
//                }
//                viewStore.send(.searchQueryChanged(String()))
//              }
//            )
//              .introspectTextField { textField in
//                textField.becomeFirstResponder()
//              }
//              .font(.body)
//              .textFieldStyle(RoundedBorderTextFieldStyle())
//              .autocapitalization(.none)
//              .disableAutocorrection(true)
//              .frame(height: 50)
//          }
//          .padding([.leading, .trailing], 16)
//        }
//        .navigationTitle("# " + viewStore.scopeTitle)
//      }
//      .navigationViewStyle(StackNavigationViewStyle())
//    }
//  }
//}

// MARK: - Private helpers
//private func formattedWeatherDay(_ data: LocationWeather.ConsolidatedWeather, isToday: Bool)
//-> String
//{
//  let date =
//  isToday
//  ? "Today"
//  : dateFormatter.string(from: data.applicableDate).capitalized
//
//  return [
//    date,
//    "\(Int(round(data.theTemp)))℃",
//    data.weatherStateName,
//  ]
//    .compactMap { $0 }
//    .joined(separator: ", ")
//}

//private let dateFormatter: DateFormatter = {
//  let formatter = DateFormatter()
//  formatter.dateFormat = "EEEE"
//  return formatter
//}()

// MARK: - SwiftUI previews
public struct Chatroom_Previews: PreviewProvider {
  public static var previews: some View {
    AppView(
      store: .init(
        initialState: AppState(),
        reducer: AppView.appReducer,
        environment: .live
      )
    )
  }
}

