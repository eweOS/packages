# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-battery-plugin
pkgver=1.2.0
pkgrel=1
pkgdesc="A battery monitor plugin for the Xfce panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/panel-plugins/xfce4-battery-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-battery-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('c78914ba1ddef189f45c5f9feee94fc5b8d4eda63e6f0e2b5026cbc4e23d5b53')

prepare() {
  cd $pkgname
  autoreconf -fiv
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
