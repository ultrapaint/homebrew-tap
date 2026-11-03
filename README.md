# Ultrapaint's Homebrew tap

[Ultrapaint](https://github.com/ultrapaint/ultrapaint)'s desktop app for macOS (Apple silicon).

```bash
brew install --cask ultrapaint/tap/ultrapaint
```

The app is not signed yet. Once after each install or upgrade, run:

```bash
xattr -dr com.apple.quarantine /Applications/Ultrapaint.app
```

Update it with `brew upgrade --cask ultrapaint`. The cask follows each release of
Ultrapaint: its release workflow updates it.
