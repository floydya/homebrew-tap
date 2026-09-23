class Vlt < Formula
  desc "Profile manager and transparent launcher for HashiCorp Vault"
  homepage "https://github.com/floydya/vlt"
  url "https://github.com/floydya/vlt/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "b86e30c3f2091c478ab28f6d76f3195f41ebb527a9d7d1b8fbf6fbd683cf1c54"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def fetch
    system "go", "mod", "download"
  end

  def install
    system "go", "build", *std_go_args(output: bin/"vlt"), "./cmd/vlt"
    generate_completions_from_executable(bin/"vlt", "completion")
  end

  test do
    assert_match "_vlt_completion", shell_output("#{bin}/vlt completion bash")
  end
end
