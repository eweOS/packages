# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpciaccess
pkgver=0.18.1
pkgrel=1
pkgdesc="X11 PCI access library"
arch=(x86_64 aarch64 riscv64)
license=('custom')
makedepends=('meson')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('ef27999446e735df2331e94219ee3dafe9198a2472bb452f63ef9c9c446d5431f9e231e224cfabdeba1402974a5a0064546f9abced4d1770f994f5fc0c2b3310')

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
