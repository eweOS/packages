# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=garcon
pkgver=4.19.2
pkgrel=1
pkgdesc="Freedesktop.org compliant menu library"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/garcon/start"
license=('LGPL-2.0-only')
groups=('xfce4')
depends=('libxfce4ui')
makedepends=('git' 'intltool' 'python' 'gobject-introspection' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/xfce/garcon.git#tag=$pkgname-$pkgver")
sha256sums=('bd26b3dd53015ef46d5b8c448496c7a448ea7fc6291cc43f3ba36aa1debb7d67')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
