# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-places-plugin
pkgver=1.8.4
pkgrel=1
pkgdesc="A menu with quick access to folders, documents, and removable media"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-places-plugin/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('libnotify' 'xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-places-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('3c8a2b772cba501fb68e9151a16bba75a82a35198cb41c4884206520ff862e71')

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
