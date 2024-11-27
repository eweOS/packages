# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-appfinder
pkgver=4.19.3
pkgrel=1
pkgdesc="Application launcher and finder"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/xfce4-appfinder/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'garcon' 'xfconf' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/xfce/xfce4-appfinder.git#tag=$pkgname-$pkgver")
sha256sums=('36a9a4eeb0381a528306dc80d86d87e851bca7bc9435be4b0ae1ba674968be67')

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
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
