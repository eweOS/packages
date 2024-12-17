# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfmpc
pkgver=0.3.1
pkgrel=1
pkgdesc='A graphical GTK+ MPD client focusing on low footprint'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://docs.xfce.org/apps/xfmpc/start'
license=('GPL-2.0-or-later')
depends=('libxfce4ui' 'libmpd')
makedepends=('git' 'vala' 'xfce4-dev-tools' 'intltool')
source=("git+https://gitlab.xfce.org/apps/xfmpc.git#tag=$pkgname-$pkgver")
sha256sums=('27cd3edefa3299f726d0e11a1dc0a972c9ab75627b99522d1e0c6cede40da808')

prepare() {
  cd $pkgname
  
  sed -i '/X11/d' configure.ac.in
  sed -i '/X11/d' src/Makefile.am
  
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
