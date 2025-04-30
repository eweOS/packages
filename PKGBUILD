# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=featherpad
pkgver=1.6.2
pkgrel=1
pkgdesc='Lightweight Qt plain text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz")
sha256sums=('0c6ad7687d933e48f5e64047dacb4d4611155210ef1557874fb708e805a50daa')

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
