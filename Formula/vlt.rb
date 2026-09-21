class Vlt < Formula
  desc "Profile manager and transparent launcher for HashiCorp Vault"
  homepage "https://github.com/floydya/vlt"
  url "https://github.com/floydya/vlt/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "f303186c7ad192a28989062d385bc49c807685114784c3c764c14663360b6bd6"
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
