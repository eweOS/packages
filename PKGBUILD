# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland-protocols
pkgver=1.39
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa')

build()
{
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
