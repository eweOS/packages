# Maintainer: Yukari CHiba <i@0x7f.cc>

pkgname=xfce4-whiskermenu-plugin
pkgver=2.8.3
pkgrel=1
pkgdesc='Menu for Xfce4'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://docs.xfce.org/panel-plugins/xfce4-whiskermenu-plugin/start'
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('garcon' 'gtk3' 'gtk-layer-shell' 'xfce4-panel')
makedepends=('cmake' 'git' 'ninja')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-whiskermenu-plugin.git#tag=v${pkgver}")
sha256sums=('cdd4e512be94fc83fdf30578826075adfc1f3c96aea520121d0741665965f7df')

build() {
  cmake -B build -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -GNinja \
    -Wno-dev \
    -DENABLE_ACCOUNTS_SERVICE=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
