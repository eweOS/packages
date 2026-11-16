# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-runner
pkgver=2.5.0
pkgrel=1
pkgdesc="The LXQt application launcher"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("lxqt-globalkeys" "muparser" "libQt6Xdg.so" "layer-shell-qt")
makedepends=("lxqt-build-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
    no-x11.patch
)
sha256sums=('f9c6b9eb9e1f91f6669436e5cf5e1fd5bcfe279eca75c2f9779b9115aad8108c'
            '2f4ba7c2a0ae180499d1909c7a65937c0b8151b819de1ca486baff8b35e73b2e')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
