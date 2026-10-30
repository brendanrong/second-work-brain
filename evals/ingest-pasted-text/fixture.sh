#!/usr/bin/env bash
# Copies the example brain into the run's empty workspace.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -R "$here/../../examples/harbour-goods/." .
