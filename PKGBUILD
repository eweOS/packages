# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ewe-pkgtool
pkgver=0.2.2
pkgrel=1
pkgdesc='A tool for easing eweOS packaging'
url='https://github.com/eweOS/ewe-pkgtool'
arch=(any)
license=(MIT)
depends=(bash)
source=("https://github.com/eweOS/ewe-pkgtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2398fd3d7ec65803ac3ec52400402cce99cd56bdb966f81c5c2e98984265d8a5')

package() {
	cd "$pkgname-$pkgver"

	make install PREFIX=/usr DESTDIR="$pkgdir"
	_install_license_ LICENSE
}
