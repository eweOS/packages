# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rollmeow
pkgver=0.4.1
pkgrel=1
pkgdesc='A generic update checker.'
url='https://github.com/eweOS/rollmeow'
arch=(any)
license=(MPL-2.0)
depends=(lua54 lua54-curl)
makedepends=(lua54-lmerge)
source=("https://github.com/eweOS/rollmeow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da7ac088932c3ad10f3e34fb5b80dfba0853c4008cdcbb8a6f4ae692957640d6')

build() {
	cd rollmeow-$pkgver/src
	make
}

package() {
	cd rollmeow-$pkgver

	install -Dm755 src/rollmeow $pkgdir/usr/bin/rollmeow
	_install_license_ LICENSE
}
