# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-cpugraph-plugin
pkgver=1.2.10
pkgrel=1
pkgdesc="Graphical representation of the CPU load"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'xfconf')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('ae4c21fe73f1c9060a95312be49bd0100cc444c83f91fe253b7f3ced5e6720eb')

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
