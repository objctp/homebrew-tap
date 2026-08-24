class Rp < Formula
  desc "CLI for managing Runpod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.3.0/rp-1.3.0.tar.gz"
  sha256 "8d4533b683ad874f6b61dc90066aa3f1faa6bb9012cc70159a9fa05ef9d645a4"
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
