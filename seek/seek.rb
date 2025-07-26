class Seek < Formula
  desc "Blazingly fast file search utility with a friendly, animated interface"
  homepage "https://github.com/CoreZen/seek"
  url "https://github.com/CoreZen/seek/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "25a9b317f7327396a88d72a8a034de664f262b58c3eeabdc76b9c472507fc1da"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    # Test that the binary runs and returns expected output
    assert_match "seek", shell_output("#{bin}/seek --help")

    # Create a test file structure and search for it
    (testpath/"test_dir").mkpath
    (testpath/"test_dir/findme.txt").write("test content")
    assert_match "findme.txt", shell_output("#{bin}/seek #{testpath}/test_dir '*.txt'")
  end
end