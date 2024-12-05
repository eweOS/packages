# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-pulseaudio-plugin
pkgver=0.4.8
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
sha256sums=('08a9d32358358ce03ae8e6d3d6496736931e666bda32705fef8ffda17ce09380' 'SKIP' 'SKIP')

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
