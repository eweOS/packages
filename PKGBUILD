# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pavucontrol-qt
pkgver=2.1.0
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
sha256sums=('6c3cfc8a4bc0b232b66516b16c32ebcd2d1d1ddb144d9e3adeea6cdffb386bbf')

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
