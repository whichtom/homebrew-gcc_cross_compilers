require 'formula'

class I386JosElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url 'ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-9.2.0/gcc-9.2.0.tar.gz'
  mirror 'https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz'
  sha256 'a931a750d6feadacbeecb321d73925cd5ebb6dfa7eff0802984af3aef63759f4'

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on 'i386-jos-elf-binutils'

  patch :DATA

  def install
    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-jos-elf',
                             '--disable-werror',
                             "--prefix=#{prefix}",
                             "--enable-languages=c,c++",
                             "--without-headers",
                             "--disable-libssp",
                             "--disable-libmudflap",
                             "--with-newlib",
                             "--with-as=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-as",
                            "--with-ld=#{Formula["i386-jos-elf-binutils"].opt_prefix}/bin/i386-jos-elf-ld"
      system 'make all-gcc'
      system 'make install-gcc'
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
    end
  end
end
