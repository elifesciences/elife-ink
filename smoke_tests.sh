#!/usr/bin/env bash
. /opt/smoke.sh/smoke.sh

smoke_url_ok $(hostname)/favicon.ico
