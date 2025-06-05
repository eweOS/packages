# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rollmeow
pkgver=0.3.2
pkgrel=1
pkgdesc='A generic update checker.'
url='https://github.com/eweOS/rollmeow'
arch=(any)
license=(MPL-2.0)
depends=(lua54 lua54-curl)
makedepends=(lua54-lmerge)
source=("https://github.com/eweOS/rollmeow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e8ab4ba64f3dfca18982fff7897ea8c8f6f0a212430259e5e3caead38999c30')

build() {
	cd rollmeow-$pkgver/src
	make
}

package() {
	cd rollmeow-$pkgver

	install -Dm755 src/rollmeow $pkgdir/usr/bin/rollmeow
	_install_license_ LICENSE
}
