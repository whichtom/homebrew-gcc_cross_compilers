require 'formula'

class I386JosElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://ftp.gnu.org/gnu/gdb/gdb-9.1.tar.gz'
  sha256 'fcda54d4f35bc53fb24b50009a71ca98410d71ff2620942e3c829a7f5d614252'

  depends_on 'i386-jos-elf-binutils'
  depends_on 'i386-jos-elf-gcc'

  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-9'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-9'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/g++-9'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-9'

    mkdir 'build' do
      system '../configure', '--target=i386-jos-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
      FileUtils.mv lib, libexec
    end
  end
end
