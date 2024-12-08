#!/usr/bin/env bash
set -e

# We assume you run this script from the GraphQLClientCore directory
# where apollo-ios-cli is located

chmod +x ./apollo-ios-cli

./apollo-ios-cli generate
