# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=qtkeychain
pkgname=(qtkeychain-qt6)
pkgver=0.14.3
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD)
depends=(glib2
         org.freedesktop.secrets)
makedepends=(clang
             cmake
             git
             qt6-declarative
             qt6-tools)
source=(git+https://github.com/frankosterfeld/qtkeychain#tag=$pkgver)
sha256sums=('81ebbe5c9635ea144bf1f4ed47daedaaa61548fee801e487aeceec4a0c66d4f1')

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
