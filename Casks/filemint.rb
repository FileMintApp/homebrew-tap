cask "filemint" do
  version "0.8.1"
  sha256 "b9ccc5cefdd6fa91bb7de170b94ccfa2dce796895f26e7c7f1bbb111b56e452b"

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
