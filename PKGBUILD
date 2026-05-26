# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qterminal
pkgver=2.4.0
pkgrel=1
pkgdesc="A lightweight Qt-based terminal emulator"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/qterminal"
# https://github.com/lxqt/qterminal/blob/2.0.0/qterminal.metainfo.xml#L10
license=('GPL-2.0-or-later' 'BSD-3-Clause')
depends=("hicolor-icon-theme" "qtermwidget" "libcanberra" "layer-shell-qt")
makedepends=("git" "cmake" "lxqt-build-tools")
source=(
  "git+https://github.com/lxqt/qterminal.git#tag=$pkgver"
  no-x11.patch
)
sha256sums=('dfef29f296a1db92cdadf6f0e2cf4d3133fe520324abdeabecbe4cff3b34710b'
            '1a20526f15dd60e2e3594deacf07fbf3fb2b431e98ef1a2584776fa782492f74')

prepare() {
  _patch_ qterminal
}

build() {
  awk '/\/\*\*/{flag=1} /\*\*\// {print; flag=0} flag' qterminal/src/third-party/qxtglobal.h > LICENSE-LibQxt

  cmake -B build -S qterminal \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 LICENSE-LibQxt -t "$pkgdir"/usr/share/licenses/$pkgname
}
