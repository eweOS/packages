# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=lua51
pkgver=5.1.5
pkgrel=4
pkgdesc='Powerful lightweight programming language designed for extending applications'
url='https://www.lua.org'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(readline)
makedepends=(patch)
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
	Makefile.patch
	src-Makefile.patch
	module-path.patch)
_V=5.1
_R=5.1.5

prepare() {
cd lua-$pkgver
	patch -p1 Makefile < ../Makefile.patch
	patch -p1 src/Makefile < ../src-Makefile.patch
	patch -p1 src/luaconf.h < ../module-path.patch

	pc=../lua$_V.pc
	grep '^V=' Makefile > $pc
	grep '^R=' Makefile >> $pc
	grep '^INSTALL_.*=' Makefile |
	  sed 's/INSTALL_TOP/prefix/;s/$(/${/;s/)/}/;s/$V/${V}/' >> $pc

	cat - >> $pc <<"EOF"
exec_prefix=${prefix}
libdir=${exec_prefix}/lib/lua5.1
includedir=${prefix}/include/lua5.1
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
	make linux
}

package() {
	cd lua-$pkgver
	make install INSTALL_TOP=$pkgdir/usr
	install -Dm 644 doc/*.{css,html,png,gif} $pkgdir/usr/share/$pkgname/doc
	install -Dm 644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm 644 ../lua$_V.pc $pkgdir/usr/lib/pkgconfig/lua$_V.pc
	ln -s lua$_V.pc	$pkgdir/usr/lib/pkgconfig/lua$_V-c++.pc

	mv $pkgdir/usr/bin/lua $pkgdir/usr/bin/lua$_V
	mv $pkgdir/usr/bin/luac $pkgdir/usr/bin/luac$_V
	mv $pkgdir/usr/share/man/man1/lua.1 $pkgdir/usr/share/man/man1/lua$_V.1
	mv $pkgdir/usr/share/man/man1/luac.1 $pkgdir/usr/share/man/man1/luac$_V.1
	ln -s liblua-$_V.so $pkgdir/usr/lib/lua$_V/liblua.so
	ln -s lua$_V/liblua.so $pkgdir/usr/lib/liblua-$_V.so
}

sha256sums=('2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333'
	    '218435db9980772bb9710bdaf1e8e73a24deb022aa16a74ba69a3a069f1a818d'
	    '397d3e00401c380f5f5b9093284db2648f1c9f25bbee04758f5f2a1e15a99f7c'
	    'ed24adcde57f197d883563ccae213e5f34505d90e4c83946826c57877d6659c8')
