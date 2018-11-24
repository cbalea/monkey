# Toggle in-call status bar
class ToggleInCallStatusBar
  def run
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e 'set frontmost to true' -e 'end tell'`
    `osascript -e 'tell application "System Events" to tell process "Simulator"' \
        -e'keystroke "y" using command down' -e'delay 1' -e'end tell'`
    sleep 1
  end
end
