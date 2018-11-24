require_relative '../../features/support/helpers/touch_actions_helper'

# Put app to background and restore it
class BackgroundApp
  include Helpers::TouchActions

  def run
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e 'set frontmost to true' -e 'end tell'`
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e'keystroke "H" using command down' -e'delay 2' -e'end tell'`
    sleep 1
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e 'set frontmost to true' -e 'end tell'`
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e'keystroke "H" using command down' -e'keystroke "H" using command down' -e'delay 2' -e'end tell'`
    tap_coordinates($WINDOW_SIZE.width / 2, $WINDOW_SIZE.height / 2)
    sleep 1
  end
end
