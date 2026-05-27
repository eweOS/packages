# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orage
pkgver=4.21.0
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/orage/start"
license=('GPL-2.0-or-later')
depends=('glib2' 'libxfce4ui' 'libnotify' 'libical')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
group=('xfce4-goodies')
optdepends=('libnotify: desktop notifications support')
source=("git+https://gitlab.xfce.org/apps/orage.git#tag=$pkgname-$pkgver")
sha256sums=('9bbd058c4196c6557accde282aef90a704ca47d9484e3fafcd560c2039561a48')

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
