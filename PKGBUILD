# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-session
pkgver=2.1.0
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
sha256sums=('b745ef14afec4bed788aeb2d448861fbc0c6f738c1ce956f4a6450f6c745270b'
            '660e7d9b0a71eb25de9e94643427db4beba73691aeaa1433c67aadf033e9d354')

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
