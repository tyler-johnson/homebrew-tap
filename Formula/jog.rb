class Jog < Formula
  desc "Memory for your working tree - automatic git snapshots, jj-style"
  homepage "https://github.com/tyler-johnson/jog"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.1.0/jog_1.1.0_darwin_arm64.tar.gz"
      sha256 "015c1cc881f7b75f95aa94c524d10d1b4ef16bf74eb49d56e8c00ced63d64a62"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.1.0/jog_1.1.0_darwin_amd64.tar.gz"
      sha256 "ca40cbd699e58485c4f25186591b632d34745aac28cdc8aecdcd18bdb947e218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.1.0/jog_1.1.0_linux_arm64.tar.gz"
      sha256 "a43efe5c081f45fba690f4045acd31e31b0d423f85d774e6fbcd361e4b002493"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.1.0/jog_1.1.0_linux_amd64.tar.gz"
      sha256 "fa7f15f6d32721f0eda407e4c23b883b7cd6ad3c08aaa6ec83f6a19e4443c6b4"
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
