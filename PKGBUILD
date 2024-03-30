# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-mpack
pkgname=(lua51-mpack lua54-mpack)
pkgver=1.0.12
pkgrel=1
pkgdesc='libmpack lua binding'
url='https://github.com/libmpack/libmpack-lua'
arch=(x86_64 aarch64 riscv64)
depends=(libmpack)
makedepends=(libmpack lua51 lua54 luarocks51 luarocks54)
source=("https://github.com/libmpack/libmpack-lua/releases/download/$pkgver/libmpack-lua-$pkgver.tar.gz"
	LICENSE)
_lvers=(5.1 5.4)
sha256sums=('06b662b1f14cfaf592ecb3fab425bef20e51439509b7a1736a790ecc929ef8bf'
            'be8d5c5a668e5fc43bc9d41f81e625fc239290c85a78c069484f81f9c704f481')

build() {
	cd libmpack-lua-$pkgver
	for v in ${_lvers[*]}; do
		undotv=${v:0:1}${v:2:3}
		luarocks-$undotv make mpack-1.0.12-0.rockspec \
			--tree=./build-$v
	done
}

do_package() {
	v=$1
	builddir=$srcdir/libmpack-lua-$pkgver/build-$v
	install -Dm755 $builddir/lib/lua/$v/mpack.so \
		$pkgdir/usr/lib/lua/$v/mpack.so
	_install_license_ $srcdir/LICENSE
}

package_lua51-mpack() {
	depends+=(lua51)
	do_package 5.1
}

package_lua54-mpack() {
	depends+=(lua54)
	do_package 5.4
}
