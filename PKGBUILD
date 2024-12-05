# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-battery-plugin
pkgver=1.1.5
pkgrel=1
pkgdesc="A battery monitor plugin for the Xfce panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/panel-plugins/xfce4-battery-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-battery-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('f6b4131c5232141d369b94eb7017a55a01d7e76c776cac654c0351ce2f032bb3')

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
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
