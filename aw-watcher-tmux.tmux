#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MONITOR_SCRIPT_PATH="$CURRENT_DIR/scripts/monitor-session-activity.sh"

# Check the operating system
if [[ "$(uname)" == "Darwin" ]]; then
  # If it's macOS, try to use Homebrew bash if available
  if [[ -f "/opt/homebrew/bin/bash" ]]; then
    /opt/homebrew/bin/bash "$MONITOR_SCRIPT_PATH" &
  else
    # Fallback to system bash if Homebrew bash not found
    echo "Warning: Homebrew bash not found. Using system bash for monitor-session-activity.sh."
    bash "$MONITOR_SCRIPT_PATH" &
  fi
else
  # For Linux and other systems, just use the default 'bash' found in PATH
  bash "$MONITOR_SCRIPT_PATH" &
fi
