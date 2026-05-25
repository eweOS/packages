# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-sudo
pkgver=2.4.0
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
sha256sums=('74aaa1663b288144f1398ff29330ce44715a51a8d7210f1672223c6052856eab')

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
