# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-build-tools
pkgver=2.2.0
pkgrel=1
pkgdesc="Various packaging tools and scripts for LXQt applications"
arch=("any")
url="https://github.com/lxqt/$pkgname"
license=("BSD")
depends=("cmake" "qt6-tools" "git" "perl")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('1214e12ca06561ca724e67092ae1265fdd23128fde449e9d3b0275cb2a051d43')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
	install -Dm644 ../$pkgname-$pkgver/BSD-3-Clause -t "$pkgdir/usr/share/licenses/$pkgname"
}
