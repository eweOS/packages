# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-bitop
pkgname=(lua51-bitop)
_pkgname=LuaBitOp
pkgver=1.0.4
pkgrel=1
url='http://bitop.luajit.org/'
pkgdesc='A C extension module adding bitwise operations on numbers.'
license=(MIT)
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=(lua51 lua54)
source=("http://bitop.luajit.org/download/LuaBitOp-$pkgver.tar.gz")
_lvers=(5.1)
sha256sums=('adc32785579fc62f7736881332f70f50fe168b2ae8d0ddb741ff018a76f48c80')

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
