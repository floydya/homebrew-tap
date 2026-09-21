class Vlt < Formula
  desc "Profile manager and transparent launcher for HashiCorp Vault"
  homepage "https://github.com/floydya/vlt"
  url "https://github.com/floydya/vlt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1aa91092b286b8ba088e375fb32bdbc4d894f7c7e0e2653784304ccc62598d50"
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
