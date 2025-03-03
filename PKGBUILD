# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-taskmanager
pkgver=1.5.8
pkgrel=1
pkgdesc="Easy to use task manager"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-taskmanager/start"
license=('GPL-2.0-or-later')
depends=('libxfce4ui' 'xfconf')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
groups=('xfce4-goodies')
source=("git+https://gitlab.xfce.org/apps/xfce4-taskmanager.git#tag=$pkgname-$pkgver")
sha256sums=('48f9453b01e066c78bd3e9c3779fe972e3ea45984cd13bf81f99653ec3ed1b46')

prepare() {
  cd $pkgname
  
  sed -i '/LIBXMU/d' src/Makefile.am
  sed -i '/LIBXMU/d' configure.ac.in
  
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
