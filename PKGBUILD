# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxfce4windowing
pkgver=4.19.9
pkgrel=1
pkgdesc="Windowing concept abstraction library for Wayland"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL-2.1-only')
depends=('gdk-pixbuf2' 'glib2' 'gtk3' 'wayland')
makedepends=('gobject-introspection' 'gtk-doc' 'wayland-protocols' 'xfce4-dev-tools')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('cb8a758ed59b95ae38190b149219fd6849c62aafe543caff21e8ff87100d1975')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --enable-wayland \
    --disable-x11 \
    --disable-debug
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
