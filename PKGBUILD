# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-pulseaudio-plugin
pkgver=0.5.1
pkgrel=1
pkgdesc="Pulseaudio plugin for the Xfce4 panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libpulse' 'libnotify' 'libcanberra')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
optdepends=('pavucontrol: default pulseaudio mixer')
source=(
  "git+https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin.git#tag=$pkgname-$pkgver"
)
sha256sums=('d230d2107d64e78ca9deb536768e7264c16b4dfb7af2cc816f6f848ae3bdc7a7')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
