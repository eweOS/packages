# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland-protocols
pkgver=1.36
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=(x86_64 aarch64 riscv64)
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92')

build()
{
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
