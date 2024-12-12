#!/usr/bin/env bash
set -e

ENDPOINT_URL="https://api-gateway.court-iq.com/graphql"
SCHEMA_PATH="GraphQL/Schema/schema.graphqls"

rover graph introspect $ENDPOINT_URL > $SCHEMA_PATH

chmod +x ./apollo-ios-cli

./apollo-ios-cli generate
