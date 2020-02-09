require 'formula'

class ArmElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url 'ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-9.2.0/gcc-9.2.0.tar.gz'
  mirror 'https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz'
  sha256 'a931a750d6feadacbeecb321d73925cd5ebb6dfa7eff0802984af3aef63759f4'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'arm-elf-binutils'

  def install
    binutils = Formulary.factory 'arm-elf-binutils'

    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-9'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-9'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-9'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-9'
    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=arm-elf-eabi', '--disable-werror',
                             "--prefix=#{prefix}",
                             "--enable-languages=c,c++",
                             "--without-headers",
                             "--with-gmp=#{Formula["gmp"].opt_prefix}",
                             "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                             "--with-mpc=#{Formula["libmpc"].opt_prefix}"
      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"arm-elf-eabi", prefix/"arm-elf-eabi"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
