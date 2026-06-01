# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orage
pkgver=4.18.0
pkgrel=3
pkgdesc="A simple calendar application with reminders for Xfce"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/orage/start"
license=('GPL-2.0-or-later')
depends=('glib2' 'libxfce4ui' 'libnotify' 'libical')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
group=('xfce4-goodies')
optdepends=('libnotify: desktop notifications support')
source=("git+https://gitlab.xfce.org/apps/orage.git#tag=$pkgname-$pkgver")
sha256sums=('b60993de942c6017635900a251011725f7fdcdd8c9e3cecd982ae872cbdc5a20')

prepare() {
  cd $pkgname
  sed -i '/XDT_CHECK_LIBX11_REQUIRE/d' configure.ac.in
  sed -i '/gdkx/d' src/appointment.c
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --disable-x11-tray-icon
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
