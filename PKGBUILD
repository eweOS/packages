# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rollmeow
pkgver=0.3.1
pkgrel=1
pkgdesc='A generic update checker.'
url='https://github.com/eweOS/rollmeow'
arch=(any)
license=(MPL-2.0)
depends=(lua54 lua54-curl)
makedepends=(lua54-lmerge)
source=("https://github.com/eweOS/rollmeow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75d06e8ea7eb81c8ec7d4b418fed644ac5e430d20e2c883ada032f8dceae8431')

build() {
	cd rollmeow-$pkgver/src
	make
}

package() {
	cd rollmeow-$pkgver

	install -Dm755 src/rollmeow $pkgdir/usr/bin/rollmeow
	_install_license_ LICENSE
}
