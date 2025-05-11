# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-sudo
pkgver=2.2.0
pkgrel=1
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
sha256sums=('8e78111c0e86597c8b8003db1e64cdfdd7e738fec2f796d1d528b6b97a45cf91')

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
