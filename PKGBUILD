# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-session
pkgver=2.5.0
pkgrel=1
pkgdesc="The LXQt session manager"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=("liblxqt" "qtxdg-tools" "xdg-user-dirs" "libudev" "kwindowsystem" "libQt6Xdg.so" "layer-shell-qt" "libprocps")
makedepends=("cmake" "lxqt-build-tools")
optdepends=(
	"breeze-icons: Default icon theme"
	"oxygen-icons: Alternative icon theme"
    "lxqt-labwc-session: Wayland session"
)
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
    no-x11.patch
)
sha256sums=('a9b65cb5ebe0ab9461f01d5810d9ccbd6ca849b60623a149113921b520c66e3f'
            '6df235584fa8fbf8c2386489de27365c0c439484f3f2afab43952df09842b7ec')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
	cmake -S "$srcdir/$pkgname-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
    # do not provide X session
    rm -r $pkgdir/usr/share/xsessions
}
