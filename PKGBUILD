# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rollmeow
pkgver=0.3.0
pkgrel=1
pkgdesc='A generic update checker.'
url='https://github.com/eweOS/rollmeow'
arch=(any)
license=(MPL-2.0)
depends=(lua54 lua54-curl)
makedepends=(lua54-lmerge)
source=("https://github.com/eweOS/rollmeow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('78e21e922248ab0d6f5a6bc877e88aa48a1bf2cb3a25c737b86729cde2ec3091')

build() {
	cd rollmeow-$pkgver/src
	make
}

package() {
	cd rollmeow-$pkgver

	install -Dm755 src/rollmeow $pkgdir/usr/bin/rollmeow
	_install_license_ LICENSE
}
