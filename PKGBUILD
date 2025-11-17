# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-about
pkgver=2.3.0
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
sha256sums=('199056c2e848f8d22b4f6818ddca04305e849c22ac059b200df5bd574aaa12bd')

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
