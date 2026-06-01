# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orage
pkgver=4.20.3
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/orage/start"
license=('GPL-2.0-or-later')
depends=('glib2' 'libxfce4ui' 'libnotify' 'libical')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
group=('xfce4-goodies')
optdepends=('libnotify: desktop notifications support')
source=("git+https://gitlab.xfce.org/apps/orage.git#tag=$pkgname-$pkgver" libical-4.patch)
sha256sums=('eda1ab1c426169c04601cf5ac423563723926020a8c09108c542257f17c0bd1d'
            '84cd1cdbfd2bd9468fb6d6f22d3133291e3ba8242446958b1b3dea8b8869247d')

prepare() {
  # libical-4.patch: copied from archlinux, add libical 4 support
  _patch_ $pkgname
  cd $pkgname
  sed -i '/XDT_CHECK_LIBX11_REQUIRE/d' configure.ac
  sed -i '/gdkx/d' src/orage-appointment-window.c
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
