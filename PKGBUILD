# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar-archive-plugin
pkgver=0.5.2
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
sha256sums=('147372fe3b114d8abb4549ae054094c4354247c4495c1927b9e6771f6f3bc1e1')

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
