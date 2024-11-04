# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ewe-pkgtool
pkgver=0.3.0
pkgrel=1
pkgdesc='A tool for easing eweOS packaging'
url='https://github.com/eweOS/ewe-pkgtool'
arch=(any)
license=(MIT)
depends=(bash)
source=("https://github.com/eweOS/ewe-pkgtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bf37cc92690519654ae87d6cc82793144ae267f39f01e771595e29d6a9c981d')

package() {
	cd "$pkgname-$pkgver"

	make install PREFIX=/usr DESTDIR="$pkgdir"
	_install_license_ LICENSE
}
