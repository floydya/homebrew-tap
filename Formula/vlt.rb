class Vlt < Formula
  desc "Profile manager and transparent launcher for HashiCorp Vault"
  homepage "https://github.com/floydya/vlt"
  url "https://github.com/floydya/vlt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2a6a580397b815d079b24f07866103bad44bf75d8af8b256f482ee03b5942973"
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
