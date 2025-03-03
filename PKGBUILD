# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-indicator-plugin
pkgver=2.4.3
pkgrel=1
pkgdesc="Plugin to display information from applications in the Xfce4 panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/panel-plugins/xfce4-indicator-plugin/start"
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'libayatana-indicator' 'xfce4-panel' 'xdg-utils')
groups=('xfce4-goodies')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-indicator-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('f76960361a996613b8e841b768199ea6370f73a8afd5b22212b59d54b5eb2e7d')

prepare() {
  cd $pkgname
  sed -i '/X11/d' configure.ac.in
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
