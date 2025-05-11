# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pavucontrol-qt
pkgver=2.2.0
pkgrel=1
pkgdesc="A Pulseaudio mixer in Qt (port of pavucontrol)"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("GPL2")
depends=("qt6-base")
makedepends=("lxqt-build-tools" "libpulse")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('f1d213426ac1033d23a8239732dc7f5fdeb393b064f11c9582e01b0c8310aee9')

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
