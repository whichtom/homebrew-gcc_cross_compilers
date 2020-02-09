GCC Cross Compilers for OS X
============================

# Changelog
- binutils-2.27 -> binutils-2.34
- gdb-7.11.1 -> gdb-9.1
- gcc-7 -> gcc-9
- cpp-7 -> cpp-9
- g++-7 -> g++-9

Just

```
brew tap whichtom/homebrew-gcc_cross_compilers
brew install --debug i386-elf-gcc
```
for `i386-elf-g++`


This fixes the problem of
```
configure:4121: checking for gcc
configure:4148: result: /usr/local/opt/gcc/bin/gcc-7
configure:4377: checking for C compiler version
configure:4386: /usr/local/opt/gcc/bin/gcc-7 --version >&5
../configure: line 4388: /usr/local/opt/gcc/bin/gcc-7: No such file or directory
configure:4397: $? = 127
configure:4386: /usr/local/opt/gcc/bin/gcc-7 -v >&5
../configure: line 4388: /usr/local/opt/gcc/bin/gcc-7: No such file or directory
configure:4397: $? = 127
configure:4386: /usr/local/opt/gcc/bin/gcc-7 -V >&5
../configure: line 4388: /usr/local/opt/gcc/bin/gcc-7: No such file or directory
configure:4397: $? = 127
configure:4386: /usr/local/opt/gcc/bin/gcc-7 -qversion >&5
../configure: line 4388: /usr/local/opt/gcc/bin/gcc-7: No such file or directory
configure:4397: $? = 127
configure:4417: checking for C compiler default output file name
configure:4439: /usr/local/opt/gcc/bin/gcc-7    conftest.c  >&5
../configure: line 4441: /usr/local/opt/gcc/bin/gcc-7: No such file or directory
configure:4443: $? = 127
configure:4480: result:
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE_URL ""
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:4486: error: in `/private/tmp/i386-elf-binutils-20200209-50116-1gmtyr/binutils-2.27/build':
configure:4490: error: C compiler cannot create executables
See `config.log' for more details.
```
