# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=exo
pkgver=4.19.1
pkgrel=1
pkgdesc="Application library for the Xfce desktop environment"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/exo/start"
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=(
  "git+https://gitlab.xfce.org/xfce/exo.git#tag=$pkgname-$pkgver"
)
sha256sums=('5c7cac778d6d74c2313fdafe10f05cfa98959115e5a81a90c01ba8b734c03b60')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
