class Rp < Formula
  desc "CLI for managing Runpod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.4.0/rp-1.4.0.tar.gz"
  sha256 "26f81c5e847bac74ea2b4db4aa8b95d47a6df28dea796a09567ca58d9a357aaa"
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
