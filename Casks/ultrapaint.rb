cask "ultrapaint" do
  version "0.1.0"
  sha256 "1724b0a59effbae935c3f2ce6f4b320bb6ba87ccc7b59f2a3de8b244727604e5"

  url "https://github.com/ultrapaint/ultrapaint/releases/download/v#{version}/ultrapaint-#{version}-mac-arm64.dmg"
  name "Ultrapaint"
  desc "Design tool that lives in your repo, next to your coding agents"
  homepage "https://github.com/ultrapaint/ultrapaint"

  depends_on arch: :arm64
  depends_on macos: :monterey

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
