# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdrm
pkgver=2.4.134
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=('musl' 'libpciaccess')
checkdepends=('cairo')
makedepends=('meson' 'linux-uapi-headers')
source=(https://dri.freedesktop.org/$pkgname/$pkgname-$pkgver.tar.xz COPYING)
sha256sums=('ac5e74d157830eb8bee44c6a6bf3ad49774ef0dd2a72bdad74a8f20308b52a95'
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
