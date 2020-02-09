require 'formula'

class X8664ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.gz'
  sha256 '53537d334820be13eeb8acb326d01c7c81418772d626715c7ae927a7d401cab3'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-9'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-9'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-9'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-9'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

    end
  end

end
