class Rp < Formula
  desc "CLI for managing RunPod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.2.0/rp-1.2.0.tar.gz"
  sha256 "62d25fcbc8d3661c1f6c0d8a7d60f2a7dadf1c42c470aedc742b87035b19485d"
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
