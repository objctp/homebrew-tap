class Rp < Formula
  desc "CLI for managing Runpod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.5.0/rp-1.5.0.tar.gz"
  sha256 "0cbd13e385c71fc126d510cd4901194156b58292064e67d830dc9a72821c3c36"
  license "MIT"

  depends_on "bash"

  def install
    inreplace "bin/rp", %r{^#!/usr/bin/env bash}, "#!#{formula_opt_bin("bash")}/bash"
    prefix.install Dir["bin", "lib", "commands", "LICENSE"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rp version")
  end
end
