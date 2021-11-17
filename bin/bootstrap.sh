#!/bin/sh

BIN_PATH=$(dirname $0)
cd $BIN_PATH/..


echo "🛠 XcodeGen for Scope"
xcodegen -s ./Core/project.yml

xcodegen -s ./project.yml