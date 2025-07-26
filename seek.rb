class Seek < Formula
  desc "Blazingly fast file search utility with a friendly, animated interface"
  homepage "https://github.com/CoreZen/seek"
  url "https://github.com/CoreZen/seek/releases/download/v0.1.1/seek-macos-universal.tar.gz"
  sha256 "f795a3e403a73a2537e4c9b53033c2273d4469beb67002d0f1e70f435ff66f2b"
  version "0.1.1"
  license "MIT"

  def install
    bin.install "seek"
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
