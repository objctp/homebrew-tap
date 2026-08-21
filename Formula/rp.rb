class Rp < Formula
  desc "CLI for managing RunPod infrastructure (volumes, serverless, pods, billing)"
  homepage "https://github.com/objctp/runpod-cli"
  url "https://github.com/objctp/runpod-cli/releases/download/1.1.0/rp-1.1.0.tar.gz"
  sha256 "67cffea63905f108ed9a4a1fbd86123f9e427bdce136d81497431a347aeeaefa"
  license "MIT"

  depends_on "bash"

  def install
    inreplace "bin/rp", %r{^#!/usr/bin/env bash}, "#!#{formula_opt_bin("bash")}/bash"
    prefix.install Dir["bin", "lib", "commands", "LICENSE"]
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/rp version")
  end
end
