# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-wavelan-plugin
pkgver=0.6.3
pkgrel=1
pkgdesc="Plugin to monitor wifi connectivity for the Xfce4 panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-wavelan-plugin/start"
license=('BSD-2-Clause')
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('git' 'intltool' 'xfce4-dev-tools' 'linux-headers')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-wavelan-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('be53ea5bdfad55cd22ad8004b7501fe9e4c0d4ea34e5f2839dfc71a662d88b7f')

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

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
