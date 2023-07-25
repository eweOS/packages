# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland-protocols
pkgver=1.32
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=(x86_64 aarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11')

build()
{
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
