# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-notifyd
pkgver=0.9.6
pkgrel=1
pkgdesc="Notification daemon for the Xfce desktop"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/notifyd/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('libxfce4ui' 'libxfce4util' 'libnotify' 'xfconf' 'sqlite' 'libcanberra'
         'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-panel' 'xfce4-dev-tools')
provides=('notification-daemon')
source=("git+https://gitlab.xfce.org/apps/xfce4-notifyd.git#tag=$pkgname-$pkgver")
sha256sums=('9b2923742de76258844073d9787b4b99769aac89b939029150e49ef5ac09f402')

prepare() {
  cd $pkgname
  sed -i '/plug/d; /gtk_main_quit/d' xfce4-notifyd-config/main.c
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  
  # TODO: user/xfce4-notifyd.service
  rm -r $pkgdir/usr/lib/systemd
}
