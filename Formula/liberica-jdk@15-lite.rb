class LibericaJdkAT15Lite < Formula
  desc "100% open-source Java implementation"
  homepage "https://bell-sw.com/"
  url "https://download.bell-sw.com/java/15.0.2%2B10/bellsoft-jdk15.0.2%2B10-linux-amd64-lite.tar.gz"
  version "15.0.2.10"
  sha256 "a09ca6dcff26ff2cc753a3c5ef5d19b57e467b810771d7e45219e92ded0fcc67"

  depends_on :linux

  def install
    prefix.install Dir["*"]
  end

  test do
    (testpath/"Hello.java").write <<~EOS
      class Hello
      {
        public static void main(String[] args)
        {
          System.out.println("Hello Homebrew");
        }
      }
    EOS
    system bin/"javac", "Hello.java"
    assert_predicate testpath/"Hello.class", :exist?, "Failed to compile Java program!"
    assert_equal "Hello Homebrew\n", shell_output("#{bin}/java Hello")
  end
end

