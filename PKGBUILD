# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=featherpad
pkgver=1.6.4
pkgrel=1
pkgdesc='Lightweight Qt plain text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz")
sha256sums=('369c39059ff8978e8ce3b8575601e8ac805595cbabf1704601e829b3a745ca8a')

build() {
  cmake -B build -S FeatherPad-$pkgver \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_QT5=OFF \
	-DWITHOUT_X11=ON \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
