# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdrm
pkgver=2.4.125
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
depends=('libpciaccess')
checkdepends=('cairo')
makedepends=('meson' 'linux-headers')
source=(https://dri.freedesktop.org/$pkgname/$pkgname-$pkgver.tar.xz COPYING)
sha256sums=('d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a'
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
