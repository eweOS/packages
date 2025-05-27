# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-diskperf-plugin
pkgver=2.8.0
pkgrel=1
pkgdesc="Displays instant disk/partition performance in the Xfce4 panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD-2-Clause')
url="https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('0f654c23de66d71ee764d732a98cd4b0e0ea89c3ccadfdf19fdddd4efe86d449')

prepare() {
  cd $pkgname
  autoreconf -fiv
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
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
