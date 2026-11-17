# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libsysstat
pkgver=1.2.0
pkgrel=1
pkgdesc="Library to query system statistics (net, resource usage, ...)"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("qt6-base")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/libsysstat/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha512sums=('93ff787f0ce9f82042dff045d7b7836d8d8c31ddba884547d9890c8fdbd5e335fd4514f502fea3f25bcd2b8cffcedd53e244b8cce68eb1ede2dff6098722d97e')

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
