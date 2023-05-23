# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=lua54
pkgver=5.4.6
pkgrel=3
pkgdesc='Powerful lightweight programming language designed for extending applications'
url='https://www.lua.org'
arch=(x86_64 aarch64)
license=(MIT)
depends=(readline)
makedepends=(patch)
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
	Makefile.patch
	src-Makefile.patch)
_V=5.4
_R=5.4.6

prepare() {
	cd lua-$pkgver
	patch -p1 Makefile < ../Makefile.patch
	patch -p1 src/Makefile < ../src-Makefile.patch

	pc=../lua$_V.pc
	grep '^V=' Makefile > $pc
	grep '^R=' Makefile >> $pc
	grep '^INSTALL_.*=' Makefile | sed 's/INSTALL_TOP/prefix/' >> $pc

	cat - >> $pc <<"EOF"
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/lua5.4
includedir=${prefix}/include/lua5.4
Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires: 
Libs: -L${libdir} -llua -lm
Cflags: -I${includedir}
EOF
}

build () {
	cd lua-$pkgver
	defPath=`tr -d "\n" <<"----"
./?.lua;
/usr/share/lua/5.4/?.lua;
/usr/share/lua/5.4/?/init.lua;
/usr/lib/lua/5.4/?.lua;
/usr/lib/lua/5.4/?/init.lua;
/usr/share/lua/common/?.lua;
/usr/share/lua/common/?/init.lua
----
`
	defCPath=`tr -d "\n" <<"----"
./?.lua;
/usr/lib/lua/5.4/?.so;
/usr/lib/lua/common/?.so;
/usr/lib/lua/5.4/loadall.so
----
`
	echo $defPath
	make linux-readline CFLAGS+="-DLUA_PATH_DEFAULT='\"$defPath\"'"	\
		CFLAGS+="-DLUA_CPATH_DEFAULT='\"$defCPath\"'"
}

package() {
	cd lua-$pkgver
	make install INSTALL_TOP=$pkgdir/usr
	install -Dm 644 doc/*.{css,html,png,gif} $pkgdir/usr/share/$pkgname/doc
	tail -n 25 src/lua.h | head -n 22 > COPYRIGHT
	install -Dm 644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm 644 $srcdir/lua$_V.pc -t $pkgdir/usr/lib/pkgconfig

	mv $pkgdir/usr/bin/lua $pkgdir/usr/bin/lua$_V
	mv $pkgdir/usr/bin/luac $pkgdir/usr/bin/luac$_V
	mv $pkgdir/usr/share/man/man1/lua.1 $pkgdir/usr/share/man/man1/lua$_V.1
	mv $pkgdir/usr/share/man/man1/luac.1 $pkgdir/usr/share/man/man1/luac$_V.1
	ln -s liblua-$_V.so $pkgdir/usr/lib/lua$_V/liblua.so
	ln -s lua$_V/liblua.so $pkgdir/usr/lib/liblua-$_V.so
	ln -s /lua$_V.pc $pkgdir/usr/lib/pkgconfig/lua$_V-c++.pc
}

sha256sums=('7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88'
	    '521841c5803146ef4cc9b728b86926455bb2dc325aa262ccde8471ac8387df17'
	    '4b45a1396e38ca61ae67cbfed0f28bb18d6f6698743cb7c271f90451d756d75a')
