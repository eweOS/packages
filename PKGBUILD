# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxfce4windowing
pkgver=4.20.0
pkgrel=1
pkgdesc="Windowing concept abstraction library for Wayland"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL-2.1-only')
depends=('gdk-pixbuf2' 'glib2' 'gtk3' 'wayland')
makedepends=('gobject-introspection' 'gtk-doc' 'wayland-protocols' 'xfce4-dev-tools')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('56f29b1d79606fb00a12c83ef4ece12877d2b22bf1acaaff89537fbe8e939f68')

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
