cask "ultrapaint" do
  version "0.2.0"
  sha256 "01f797109c95fc624db5b4245074b7815fe7f7026d7661bed36111445d6530d7"

  url "https://github.com/ultrapaint/ultrapaint/releases/download/v#{version}/ultrapaint-#{version}-mac-arm64.dmg"
  name "Ultrapaint"
  desc "Design tool that lives in your repo, next to your coding agents"
  homepage "https://github.com/ultrapaint/ultrapaint"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Ultrapaint.app"

  zap trash: [
    "~/Library/Application Support/Ultrapaint",
    "~/Library/Caches/ultrapaint-updater",
    "~/Library/Logs/Ultrapaint",
    "~/Library/Preferences/dev.ultrapaint.desktop.plist",
    "~/Library/Saved Application State/dev.ultrapaint.desktop.savedState",
  ]

  caveats <<~EOS
    Ultrapaint is not signed yet, so macOS says it "is damaged" until you run, once
    after each install or upgrade:

      xattr -dr com.apple.quarantine /Applications/Ultrapaint.app

    Update it with: brew upgrade --cask ultrapaint
  EOS
end
