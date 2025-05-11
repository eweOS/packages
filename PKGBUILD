# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qterminal
pkgver=2.2.1
pkgrel=2
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
sha256sums=('557f260fff85dd277ef340199f6db262bbe1af8e81c7d385ca056e76e71aea1b'
            'bb8ff91bf7d0cfd6ae41f2f8110a6657114a109167c58fcd4b18c1028d6bb30c')

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
