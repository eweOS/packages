# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfburn
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple CD/DVD burning tool based on libburnia libraries"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfburn/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('libburn' 'libisofs' 'gtk3' 'libxfce4ui' 'exo' 'gst-plugins-base-libs'
         'desktop-file-utils')
makedepends=('git' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/apps/xfburn.git#tag=$pkgname-$pkgver")
sha256sums=('f928ca59342c586c9138a686f8a6861281794fceda1b459abf00621308fca7c3')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-gstreamer \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
