require "language/node"

class Api < Formula
  desc "Optic CLI"
  homepage "https://github.com/opticdev/optic"
  url "https://registry.npmjs.org/@useoptic/cli/-/cli-10.2.2.tgz"
  sha256 "cf813c2daa8a36a67f06a4e9b65cfbfa4a94c28015b7d65f4b51c4d681167d8b"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node@14"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    rewrite_info = Utils::Shebang::RewriteInfo.new(
      %r{#!/usr/bin/env node},
      20,
      "#{HOMEBREW_PREFIX}/opt/node@14/bin/node\\1",
    )
    Utils::Shebang.rewrite_shebang rewrite_info, "#{libexec}/lib/node_modules/@useoptic/cli/bin/run"

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "@useoptic/cli", shell_output("#{bin}/api --version | awk '{print $1}'")
  end
end
