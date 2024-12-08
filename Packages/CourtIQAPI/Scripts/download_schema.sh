#!/usr/bin/env bash
set -e

ENDPOINT_URL="https://api-gateway.court-iq.com/graphql"
SCHEMA_PATH="Schema/schema.graphqls"

rover graph introspect $ENDPOINT_URL > $SCHEMA_PATH
