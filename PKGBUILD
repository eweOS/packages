# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar-archive-plugin
pkgver=0.6.0
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
sha256sums=('01543943f188c341f2b4c698b99279de81202673a5446ff1b391d51e95fc46f8')

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
