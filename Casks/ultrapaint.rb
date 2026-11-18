cask "ultrapaint" do
  version "0.3.0"
  sha256 "c53613ac4feeb1f0b069977f3eba1c3b2f247192adffad2151944ac7664b98c3"

  url "https://github.com/ultrapaint/ultrapaint/releases/download/v#{version}/ultrapaint-#{version}-mac-arm64.dmg"
  name "Ultrapaint"
  desc "Design tool that lives in your repo, next to your coding agents"
  homepage "https://github.com/ultrapaint/ultrapaint"

  # The app updates itself (ADR 0078): `brew upgrade` leaves a bundle already at this version alone.
  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Ultrapaint.app"
  # The ultrapaint command, a launcher the app ships that finds the app from where it is.
  binary "#{appdir}/Ultrapaint.app/Contents/Resources/bin/ultrapaint"

  # A command the app itself wrote into Homebrew's bin (Settings › Agents › Install the command)
  # gives way to the link above.
  preflight_steps do
    remove "{{HOMEBREW_PREFIX}}/bin/ultrapaint",
           content_contains: "The ultrapaint command of the Ultrapaint app"
  end

  zap trash: [
    "~/Library/Application Support/Ultrapaint",
    "~/Library/Caches/ultrapaint-updater",
    "~/Library/Logs/Ultrapaint",
    "~/Library/Preferences/dev.ultrapaint.desktop.plist",
    "~/Library/Saved Application State/dev.ultrapaint.desktop.savedState",
  ]

  caveats <<~EOS
    Ultrapaint is not signed yet, so macOS says it "is damaged", and may stop the
    ultrapaint command, until you run, once after each install or upgrade:

      xattr -dr com.apple.quarantine /Applications/Ultrapaint.app

    Agents outside the app reach it through `ultrapaint mcp`, e.g.:

      claude mcp add ultrapaint -s user -- ultrapaint mcp

    It updates itself; to update it through Homebrew: brew upgrade --cask ultrapaint
  EOS
end
