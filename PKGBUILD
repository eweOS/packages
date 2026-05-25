# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-globalkeys
pkgver=2.4.0
pkgrel=1
pkgdesc="LXQt daemon and library for global keyboard shortcuts registration."
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("liblxqt")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('6f7fb82337bd06823f698df5a1e631059e99e544bfa9a1d7c5b67fd01ff9319a')

prepare() {
  # no x11
  sed -i '/daemon/d' $pkgname-$pkgver/CMakeLists.txt
}

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
