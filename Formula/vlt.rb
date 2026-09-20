class Vlt < Formula
  desc "Profile manager and transparent launcher for HashiCorp Vault"
  homepage "https://github.com/floydya/vlt"
  url "https://github.com/floydya/vlt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6273945813a161caddff833ccfbf8752862111b53bdbbc657c6f6e115305cc4e"
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
