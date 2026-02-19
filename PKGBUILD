# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=unifdef
pkgver=2.12
pkgrel=1
pkgdesc='Utility to selectively process preprocessor conditionals'
url='https://dotat.at/prog/unifdef/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
source=("https://dotat.at/prog/unifdef/unifdef-$pkgver.tar.gz")
sha256sums=('fba564a24db7b97ebe9329713ac970627b902e5e9e8b14e19e024eb6e278d10b')

_makeflags=(prefix=/usr)

build() {
	cd "$pkgname-$pkgver"

	make "${_makeflags[@]}"
}

package() {
	cd "$pkgname-$pkgver"

	make "${_makeflags[@]}" install DESTDIR="$pkgdir"
	_install_license_ COPYING
}
