# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-build-tools
pkgver=2.4.0
pkgrel=1
pkgdesc="Various packaging tools and scripts for LXQt applications"
arch=("any")
url="https://github.com/lxqt/$pkgname"
license=("BSD")
depends=("cmake" "qt6-tools" "git" "perl")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('14999ff954e820a23af44389b9f7c65f9e58b2f1c0a559f0badd38f9b459aee6')

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
