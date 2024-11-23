# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pcmanfm-qt
pkgver=2.1.0
pkgrel=1
pkgdesc="The LXQt file manager, Qt port of PCManFM"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/pcmanfm-qt/blob/1.4.1/README.md?plain=1#L12
license=("GPL-2.0-or-later")
depends=("desktop-file-utils" "libfm-qt" "libfm-qt6.so" "layer-shell-qt")
makedepends=("lxqt-build-tools")
optdepends=(
	"gvfs: for various features like mounting without root, remote filesystems, encrypted filesystems and many others mentioned on https://github.com/lxqt/pcmanfm-qt/wiki"
	"gvfs-mtp: MTP support (Media Transfer Protocol)"
	"lxqt-archiver: archive management"
	"qt6-translations: allow keyboard shortcuts to function in some languages (e.g. German)"
)
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
	no-x11.patch
)
sha256sums=('e63486571dfa1bc476785f0d881e2138c736708009589c05a93ab24575e06b4f'
            'e5b8cbf0bbeef586bf78216ee0d86a3a0bdd16476770277015b3eeb27200608f')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
	cmake -B build -S "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
