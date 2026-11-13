# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-about
pkgver=2.5.0
pkgrel=1
pkgdesc="LXQt about dialog."
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("liblxqt" "libQt6Xdg.so")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('9ad20edb62b177a6149c5d9f15550944339a938801a9a11b2fc3ac11d9c6fc7c')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
