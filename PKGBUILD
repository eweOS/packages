# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-places-plugin
pkgver=1.8.3
pkgrel=1
pkgdesc="A menu with quick access to folders, documents, and removable media"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-places-plugin/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('libnotify' 'xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-places-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('9e87facd1ecca5374a30d84f285f25eaea2a6a3bd28043d85d3da608f5a62d69')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
