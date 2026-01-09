# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=featherpad
pkgver=1.6.3
pkgrel=1
pkgdesc='Lightweight Qt plain text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz")
sha256sums=('f20a2e1b82524d181c97bb23d1b643ae374b9257a8c2c95bcaf0d0c940a2c9ee')

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
