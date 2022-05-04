#!/usr/bin/env bash

MONIKER=${MONIKER:-moniker}
OSMOSIS_HOME=${OSMOSIS_HOME:-$HOME/.osmosisd}

sed -i "s/moniker = \"eddy\"/moniker = \"$MONIKER\"/g" "$OSMOSIS_HOME"/config/config.toml

osmosisd start --home "$OSMOSIS_HOME"
