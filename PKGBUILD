# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar-archive-plugin
pkgver=0.5.3
pkgrel=1
pkgdesc="Adds archive operations to the Thunar file context menus"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/thunar/archive"
license=('GPL-2.0-only')
groups=('xfce4-goodies')
depends=('thunar' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
optdepends=('file-roller' 'engrampa' 'ark' 'xarchiver')
source=("git+https://gitlab.xfce.org/thunar-plugins/thunar-archive-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('5b74a059e7cd9a7f64667ab48a5dbe5a18188c5d0b97bf5d278c49d0df4d4239')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
