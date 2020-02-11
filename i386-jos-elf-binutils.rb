require 'formula'

class I386JosElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.gz'
  sha256 '53537d334820be13eeb8acb326d01c7c81418772d626715c7ae927a7d401cab3'

  def install
    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-jos-elf','--disable-werror',
                               '--enable-gold=yes',
                               "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

      if Formula['i386-jos-elf-gdb'].installed?
        rm_r share/"info"
        rm_r lib
      end
    end
  end
end
