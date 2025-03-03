# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-pulseaudio-plugin
pkgver=0.4.9
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
  "no-x11.patch::https://github.com/xfce-mirror/xfce4-pulseaudio-plugin/commit/58bbbee23cb1782cf1f04db883a87acbf3c907a1.patch"  
  "fix-window.patch::https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/commit/35d5172d514e1fb1bdb6718041d0e8c0f70eae3b.patch"
)
sha256sums=('b686b469b699c073e838e04382bab2282aff13cb1a2086065b38c8c5f673d934'
            '1295beadfddbe63e7a10e727c792a4de62769f898250f0feaf8aa37c93e56a92'
            '491ecf742287b6c4550c28442f1cd6e3213fd4fff998cbec53e6c0160bc7b2db')

prepare() {
  _patch_ $pkgname
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
