# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qterminal
pkgver=2.1.0
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
sha256sums=('c822109ebb4ef6f2839e956304ccfff2b56abfbefe15b3f3277321e01ccb98c1'
            'ac90e7df26859a9c2a6610a8716fa6ec93bfccfe02619395f3427f1ca1ae8f7e')

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
