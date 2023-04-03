# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland-protocols
pkgver=1.31
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=(x86_64 aarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238')

build()
{
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
