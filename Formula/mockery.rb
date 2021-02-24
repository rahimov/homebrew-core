class Mockery < Formula
  desc "Mock code autogenerator for Golang"
  homepage "https://github.com/vektra/mockery"
  url "https://github.com/vektra/mockery/archive/v2.3.0.tar.gz"
  sha256 "ec373ef32fccdd1b9277e0de7c19b37fb1b64d7a230831cc0d41033f554e15df"
  license "BSD-3-Clause"
  revision 1
  head "https://github.com/vektra/mockery.git"


  depends_on "go"

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X github.com/vektra/mockery/v2/pkg/config.SemVer=#{version}"
  end

  test do
    output = shell_output("#{bin}/mockery --keeptree 2>&1", 1)
    assert_match "Starting mockery dry-run=false version=#{version}", output

    output = shell_output("#{bin}/mockery --all --dry-run 2>&1")
    assert_match "INF Walking dry-run=true version=#{version}", output
  end
end
