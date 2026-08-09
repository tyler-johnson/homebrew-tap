class Jog < Formula
  desc "Memory for your working tree - automatic git snapshots, jj-style"
  homepage "https://github.com/tyler-johnson/jog"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.2.0/jog_1.2.0_darwin_arm64.tar.gz"
      sha256 "f14896e6bebf49e2537ef368c07a68b5e88181c6c784d01eb4f00fc9327ca4b6"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.2.0/jog_1.2.0_darwin_amd64.tar.gz"
      sha256 "7b358d61e01588062676220e23c8c23a26830f0eb035d9e9f7d49b077a528311"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tyler-johnson/jog/releases/download/v1.2.0/jog_1.2.0_linux_arm64.tar.gz"
      sha256 "3a01a0135ebe3c186a7bcff1b08e315f3e08fa22d14144cd93cb31fd2bb996d6"
    else
      url "https://github.com/tyler-johnson/jog/releases/download/v1.2.0/jog_1.2.0_linux_amd64.tar.gz"
      sha256 "12ef6cedbd45e9338d6cfbbb2529d1e3430b0db4cf7d3c740f8c73c7d2bfbe88"
    end
  end

  def install
    bin.install "jog"
  end

  def caveats
    <<~EOS
      jog only snapshots when something invokes it. Wire the triggers:

        1. Shell alias (bash/zsh):  alias git='jog git'
        2. Agent hooks + skills:    jog agents install
        3. Editor save hooks:       jog editors install <editor>

      Then verify with:  jog doctor
    EOS
  end

  test do
    system bin/"jog", "version"
  end
end
