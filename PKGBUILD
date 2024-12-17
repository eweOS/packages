# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-dict
pkgver=0.8.8
pkgrel=1
pkgdesc="A dictionary plugin for the Xfce panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-dict/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'librsvg' 'hicolor-icon-theme' 'glib2')
makedepends=('git' 'xfce4-dev-tools')
source=(
  "git+https://gitlab.xfce.org/apps/xfce4-dict.git#tag=$pkgname-$pkgver"
  remove-x11-includes.patch::https://gitlab.xfce.org/apps/xfce4-dict/-/commit/83b024f78ca0da1d07e7f9d76e868c816935de9e.patch
)
sha256sums=('641eb4da7db325f97f07d521330554e39e1e746bf0580887aad1ec745fb4b72b'
            'b78111b339164bdf057fac464d207c03cf4ad145abf9bbbf37ccc12ee9139cc0')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  
  sed -i '/X11/d' configure.ac
  sed -i '/X11/d' src/Makefile.am
  sed -i '/X11/d' panel-plugin/Makefile.am
  
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
