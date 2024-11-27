# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfdesktop
pkgver=4.19.6
pkgrel=1
pkgdesc="Xfce's desktop manager"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'exo' 'thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4windowing' 'gtk-layer-shell' 'libyaml')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/xfce/xfdesktop.git#tag=$pkgname-$pkgver")
sha256sums=('c595b69fde889a425f207d8631a8c43887487b65a50fda12c207239f081c3324')

prepare() {
  cd $pkgname
  sed -i '/gdkx/d' src/windowlist.c
  sed -i '/xfce_sm_client_get_option_group/d' src/main.c
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-thunarx \
    --enable-notifications \
    --disable-debug \
    --enable-maintainer-mode \
    --disable-x11
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
