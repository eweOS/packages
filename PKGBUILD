# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rollmeow
pkgver=0.2.0
pkgrel=2
pkgdesc='A generic update checker.'
url='https://github.com/eweOS/rollmeow'
arch=(any)
license=(MPL-2.0)
depends=(lua54 lua54-curl)
makedepends=(lua54-lmerge)
source=("https://github.com/eweOS/rollmeow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e68d3079003a1c29ea4080d35a942b721eadb3853c7af45efbe59b610cfeb4a1')

build() {
	cd rollmeow-$pkgver/src
	make
}

package() {
	cd rollmeow-$pkgver

	install -Dm755 src/rollmeow $pkgdir/usr/bin/rollmeow
	_install_license_ LICENSE
}
