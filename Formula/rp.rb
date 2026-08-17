class Rp < Formula
  desc "CLI for managing RunPod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.0.0/rp-1.0.0.tar.gz"
  sha256 "97c4cc80e608e5bd5cfbee04c8c7ca14dd0b7a6e9619fe6a6b1668cdecd97b11"
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
