#!/usr/bin/env bash
set -e

ENDPOINT_URL="http://localhost:3000"
SCHEMA_PATH="GraphQL/Schema/schema.graphqls"

rover graph introspect $ENDPOINT_URL > $SCHEMA_PATH

chmod +x ./apollo-ios-cli

./apollo-ios-cli generate
