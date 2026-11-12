# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-build-tools
pkgver=2.5.0
pkgrel=1
pkgdesc="Various packaging tools and scripts for LXQt applications"
arch=("any")
url="https://github.com/lxqt/$pkgname"
license=("BSD")
depends=("cmake" "qt6-tools" "git" "perl")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('eeeeb7dbc2271238306139e660acabe4124b3ebab5434e1e40b1f08cf5bcd4ce')

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
