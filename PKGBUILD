# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-bitop
pkgname=(lua51-bitop)
_pkgname=LuaBitOp
pkgver=1.0.2
pkgrel=1
url='http://bitop.luajit.org/'
pkgdesc='A C extension module adding bitwise operations on numbers.'
license=(MIT)
arch=(x86_64 aarch64 riscv64)
makedepends=(lua51 lua54)
source=("http://bitop.luajit.org/download/LuaBitOp-$pkgver.tar.gz")
_lvers=(5.1)
sha256sums=('1207c9293dcd52eb9dca6538d1b87352bd510f4e760938f5048433f7f272ce99')

build() {
	for v in ${_lvers[*]}; do
		cp -rf $srcdir/$_pkgname-$pkgver $srcdir/build-$v
		cd $srcdir/build-$v
		make LUA=lua$v INCLUDES=$(pkg-config --cflags lua$v)
	done

	head -n 27 $srcdir/$_pkgname-$pkgver/bit.c > $srcdir/license
}

check() {
	for v in ${_lvers[*]}; do
		cd $srcdir/build-$v
		make test LUA=lua$v
	done
}

do_package() {
	v=$1
	install -Dm755 $srcdir/build-$v/bit.so $pkgdir/usr/lib/lua/$v/bit.so
	_install_license_ $srcdir/license
}

package_lua51-bitop() {
	depends=(lua51)
	do_package 5.1
}
