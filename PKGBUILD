# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pavucontrol-qt
pkgver=2.4.0
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
sha256sums=('7f813d3029e9f1b66020cf3da143d07196dd8bce01a95bd754489287ca5b6380')

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
