# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-taskmanager
pkgver=1.6.0
pkgrel=1
pkgdesc="Easy to use task manager"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-taskmanager/start"
license=('GPL-2.0-or-later')
depends=('libxfce4ui' 'xfconf')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
groups=('xfce4-goodies')
source=("git+https://gitlab.xfce.org/apps/xfce4-taskmanager.git#tag=$pkgname-$pkgver")
sha256sums=('2304041ba75c7153f96cbccf238769aaf3e4145874e7d8bef70511185460a68a')

prepare() {
  cd $pkgname
  sed -i '/LIBXMU/d' src/Makefile.am
  sed -i '/LIBXMU/d' configure.ac
  autoreconf -fiv
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
