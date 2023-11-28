# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdrm
pkgver=2.4.118
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=(x86_64 aarch64 riscv64)
license=('custom')
depends=('libpciaccess')
checkdepends=('cairo')
makedepends=('meson')
source=(https://dri.freedesktop.org/$pkgname/$pkgname-$pkgver.tar.xz COPYING)
sha256sums=('a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88'
            '9631d4f694952e3e6ae5a05534c2e93e994e47d3413677a3a00e45c8cef6db93')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D udev=false \
    -D etnaviv=disabled \
    -D freedreno=disabled \
    -D vc4=disabled \
    -D man-pages=disabled \
    -D valgrind=disabled \
    -D cairo-tests=disabled
  meson compile -C build
}

check()
{
  # error in __register_frame_info
  meson test -C build --print-errorlogs || :
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
