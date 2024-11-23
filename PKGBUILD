# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-globalkeys
pkgver=2.1.0
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
sha256sums=('70cc56c452626a2c3ceb7ade8745ed61bac10c7d9aa082443a74aba1e3942874')

prepare() {
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
