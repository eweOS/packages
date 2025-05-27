# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-cpugraph-plugin
pkgver=1.3.0
pkgrel=1
pkgdesc="Graphical representation of the CPU load"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'xfconf')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('3fc84010c1d43f011f2a06ba545a71c93365c911f99faf0fc02d7256e07adcdb')

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
