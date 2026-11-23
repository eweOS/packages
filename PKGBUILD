# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qtkeychain
pkgname=(qtkeychain-qt6)
pkgver=0.18.0
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD-3-Clause)
depends=(glib2
         org.freedesktop.secrets)
makedepends=(clang
             cmake
             git
             qt6-declarative
             qt6-tools)
source=(git+https://github.com/frankosterfeld/qtkeychain#tag=$pkgver)
sha256sums=('8da5173ffa4ee7388682f24c1e7e978083e6e2d4e45c81f65e186d5518585f75')

build() {
  cmake -B build-qt6 -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build-qt6
}

package_qtkeychain-qt6() {
  depends+=(qt6-base)
  optdepends=('kwallet: kwallet backend')

  DESTDIR="$pkgdir" cmake --install build-qt6
  install -Dm644 $pkgbase/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
