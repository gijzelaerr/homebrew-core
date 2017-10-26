class QuickDer < Formula
  desc "Quick `n' Easy DER library"
  homepage "https://github.com/vanrein/quick-der"
  url "https://github.com/vanrein/quick-der/archive/version-1.2-2.tar.gz"
  sha256 "e89787f705049ad2ebe4b1ab6415f44ff83f5807ad9939f5aa3a4c22265970a0"

  depends_on "cmake" => :build

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test.asn1").write <<~EOS
      test DEFINITIONS ::= BEGIN
      ACK-BYTE ::= OCTET STRING (SIZE(1))
      END
    EOS
    system "#{bin}/asn1literate", "./test.asn1"
  end
end
