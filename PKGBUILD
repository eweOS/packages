# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-sudo
pkgver=2.3.0
pkgrel=2
pkgdesc="LXQt privilege program (lxsu)."
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("liblxqt")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('79bf1e4eb39b61fd00221e908189ba1a4a06f0ee84d3bd1f31a81293f2b1cca1')

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
