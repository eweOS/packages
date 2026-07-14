# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=lua55
pkgver=5.5.0
pkgrel=2
_V=5.5
_R=5.5.0
pkgdesc='Powerful lightweight programming language designed for extending applications'
url='https://www.lua.org'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
optdepends=('readline: For better REPL experience')
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
	Makefile.patch
	src-Makefile.patch)
sha256sums=('57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d'
            'be2ede530da43115d2f622aec5211a4fd4b576f5cc527ac9e309080bf35ce055'
            '81cb2d015272df804fc65a09b342dbc918d339eaecefb3bbb2027e73b9e6a7f7')

prepare()
{
  cd lua-$pkgver
  patch -p1 Makefile < ../Makefile.patch
  patch -p1 src/Makefile < ../src-Makefile.patch

  pc=../lua$_V.pc
  echo "V=$_V" > $pc
  echo "R=$_R" >> $pc
  grep '^INSTALL_.*=' Makefile |
    sed 's/INSTALL_TOP/prefix/;s/$(/${/;s/)/}/;s/$V/${V}/' >> $pc

  cat - >> $pc << "EOF"
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/lua5.5
includedir=${prefix}/include/lua5.5
Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua-5.5 -lm
Cflags: -I${includedir}
EOF
}

build()
{
  cd lua-$pkgver
  defPath=$(
    tr -d "\n" << "----"
./?.lua;
/usr/share/lua/5.5/?.lua;
/usr/share/lua/5.5/?/init.lua;
/usr/lib/lua/5.5/?.lua;
/usr/lib/lua/5.5/?/init.lua;
/usr/share/lua/common/?.lua;
/usr/share/lua/common/?/init.lua
----
  )
  defCPath=$(
    tr -d "\n" << "----"
./?.so;
/usr/lib/lua/5.5/?.so;
/usr/lib/lua/common/?.so;
/usr/lib/lua/5.5/loadall.so
----
  )
  echo $defPath
  make linux CFLAGS+="-DLUA_PATH_DEFAULT='\"$defPath\"'" \
    CFLAGS+="-DLUA_CPATH_DEFAULT='\"$defCPath\"'" \
    CFLAGS+="-DLUA_USE_POSIX -DLUA_USE_DLOPEN -DLUA_USE_LINUX" \
    MYLDFLAGS+="$LDFLAGS"
}

package()
{
  cd lua-$pkgver
  make install INSTALL_TOP="$pkgdir"/usr
  install -Dm 644 doc/*.{css,html,png} "$pkgdir/usr/share/$pkgname/doc"
  tail -n 25 src/lua.h | head -n 22 > COPYRIGHT
  _install_license_ COPYRIGHT
  install -Dm 644 $srcdir/lua$_V.pc -t "$pkgdir/usr/lib/pkgconfig"

  mv "$pkgdir"/usr/bin/{lua,lua$_V}
  mv "$pkgdir"/usr/bin/{luac,luac$_V}
  mv "$pkgdir"/usr/share/man/man1/{lua.1,lua$_V.1}
  mv "$pkgdir"/usr/share/man/man1/{luac.1,luac$_V.1}
  ln -s liblua-$_V.so "$pkgdir"/usr/lib/lua$_V/liblua.so
  ln -s lua$_V/liblua.so "$pkgdir"/usr/lib/liblua-$_V.so
  ln -s lua$_V.pc "$pkgdir"/usr/lib/pkgconfig/lua$_V-c++.pc
}
