# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=featherpad
pkgver=1.5.2
pkgrel=2
pkgdesc='Lightweight Qt plain text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz")
sha256sums=('d63d977c875ee18be1ef007b8cd653ae495018184ea641e2bbc812781b926e87')

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
