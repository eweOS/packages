# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libsysstat
pkgver=1.1.0
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
sha512sums=('5bcaed044081314dfdc9034c496ee02138160ba3d0d49b137a4860b840f4371a80ba5e0b90ae2e021c73102c71f59cdcfc76fb23678e9010f55913ee15461c4c')

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
