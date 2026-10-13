cask "filemint" do
  version "0.7.0"
  sha256 "ad1e52082e1443ca2cfcac56eb3c795feede57e8d6cb44504a3820a759aa16d1"

  url "https://github.com/FileMintApp/FileMint/releases/download/v#{version}/FileMint-#{version}.dmg"
  name "FileMint"
  desc "Create files and use file tools from Finder"
  homepage "https://filemintapp.github.io/FileMint/"

  livecheck do
    url :url
    regex(/^v(\d+\.\d+\.\d+)$/)
    strategy :github_latest do |json, regex|
      json["tag_name"]&.[](regex, 1)
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "FileMint.app"

  caveats <<~EOS
    Before a Homebrew upgrade, reinstall, adoption or uninstall, save or cancel
    drafts, finish file operations and Sparkle updates, then manually quit
    FileMint and confirm it has exited. Homebrew does not enforce this check.
    Enable the Finder extension and grant folder access in the existing app
    and macOS settings. Uninstalling retains preferences and imported templates.
  EOS
end
