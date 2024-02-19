# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpciaccess
pkgver=0.18
pkgrel=1
pkgdesc="X11 PCI access library"
arch=(x86_64 aarch64 riscv64)
license=('custom')
makedepends=('meson')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd')

build()
{
  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE" ewe-meson ${pkgname}-${pkgver} build
  ninja -C build
}

package()
{
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 $pkgname-$pkgver/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
