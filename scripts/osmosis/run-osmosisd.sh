#!/usr/bin/env bash

MONIKER=${MONIKER:-moniker}
OSMOSIS_HOME=${OSMOSIS_HOME:-$HOME/.osmosisd}

# apply custom moniker
sed -i "s/moniker = \"eddy\"/moniker = \"$MONIKER\"/g" "$OSMOSIS_HOME"/config/config.toml

# disable indexer
sed -i "s/indexer = \"kv\"/indexer = \"null\"/g" "$OSMOSIS_HOME"/config/config.toml

# enable prometheus
sed -i "s/prometheus = false/prometheus = true/g" "$OSMOSIS_HOME"/config/config.toml

# CORS
sed -i "s/cors_allowed_origins = []/cors_allowed_origins = [\"*\"]/g" "$OSMOSIS_HOME"/config/config.toml

# prune everything
sed -i "s/pruning = \"custom\"/pruning = \"everything\"/g" "$OSMOSIS_HOME"/config/app.toml

osmosisd start --home "$OSMOSIS_HOME"
