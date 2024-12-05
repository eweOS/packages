# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfburn
pkgver=0.7.2
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
sha256sums=('17a9d51c1b768b0044d5651a2d1bca0763135013a28e0f9304cc531413fd38b5')

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
