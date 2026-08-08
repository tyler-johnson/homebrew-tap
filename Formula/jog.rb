class Jog < Formula
  desc "Memory for your working tree - automatic git snapshots, jj-style"
  homepage "https://github.com/tyler-johnson/jog"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.0.0/jog_1.0.0_darwin_arm64.tar.gz"
      sha256 "2e23da50699214d4d6826bf4889717020392fccde85c1fdf23fcfdd003c0708a"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.0.0/jog_1.0.0_darwin_amd64.tar.gz"
      sha256 "08489dc5e46ba8fb8cc1a7a3faef30446284579585392db4b12b5d63160b6249"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.0.0/jog_1.0.0_linux_arm64.tar.gz"
      sha256 "b36129a95ba63672cf00d8bb0502ff278b6e0f66774df0eb052da5a7eb01ebaa"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.0.0/jog_1.0.0_linux_amd64.tar.gz"
      sha256 "a8b9713f228dd5df7156e8b52d02b911ff47643b09e9d3a988653cef1f25f085"
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
