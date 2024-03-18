# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland-protocols
pkgver=1.33
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=(x86_64 aarch64 riscv64)
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a')

build()
{
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
