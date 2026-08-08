class Jog < Formula
  desc "Memory for your working tree - automatic git snapshots, jj-style"
  homepage "https://github.com/tyler-johnson/jog"
  version "0.1.0"
  license "MIT"

  BASE = "https://github.com/tyler-johnson/jog/releases/download/v0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "#{BASE}/jog_0.1.0_darwin_arm64.tar.gz"
      sha256 "6c59b7acf9abc2ebadc298b64c50382b86fbba07da55fb42cad5ef579a1adbde"
    else
      url "#{BASE}/jog_0.1.0_darwin_amd64.tar.gz"
      sha256 "f60d3b80f5f9fe9149a06a28c2cd39cc9b5257abf72e50a04a9b01c3b8bd1815"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{BASE}/jog_0.1.0_linux_arm64.tar.gz"
      sha256 "1fd8c18c462fd2dca1e3eb08c5f2876e366e90698afe0ee8502a89b953adfee8"
    else
      url "#{BASE}/jog_0.1.0_linux_amd64.tar.gz"
      sha256 "db1a4b7e7e38c5bd82bb60ead7426c3a76dff23e0541182c605497dde3c6570c"
    end
  end

  def install
    bin.install "jog"
  end

  def caveats
    <<~EOS
      jog only snapshots when something invokes it. Wire the triggers:

        1. Shell alias (bash/zsh):  alias git='jog git'
        2. Claude Code hooks:       see https://github.com/tyler-johnson/jog#install

      Then verify with:  jog doctor
    EOS
  end

  test do
    system bin/"jog", "version"
  end
end
