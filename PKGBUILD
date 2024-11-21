# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-sudo
pkgver=2.1.0
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
sha256sums=('7a3abcf4153b699c4990b1ac89d2bc122fcebf6d5ae061e0c129a4bad922739d')

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
