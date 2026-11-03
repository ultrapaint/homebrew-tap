cask "ultrapaint" do
  version "0.1.1"
  sha256 "9e4600ecc1d024f6a15d775108ce64a29ebd4540f4c2e49fe486eca0f69f17fb"

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
