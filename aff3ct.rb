# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Aff3ct < Formula
  desc "AFF3CT is a simulator dedicated to the Forward Error Correction (FEC or channel coding). It is written in C++ and it supports a large range of codes: from the well-spread Turbo codes to the very new Polar codes including the Low-Density Parity-Check (LDPC) codes. AFF3CT is a command line program and it simulates communication chains based on a Monte Carlo method."
  homepage "https://github.com/aff3ct/aff3ct"
  url "https://github.com/aff3ct/aff3ct", :using => :git, :tag => "v2.3.2"
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DAFF3CT_COMPILE_SHARED_LIB=ON -DAFF3CT_COMPILE_STATIC_LIB=ON"
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test aff3ct`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
