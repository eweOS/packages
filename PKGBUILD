
# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-panel
pkgver=4.20.5
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/xfce4-panel/start"
license=('LGPL-2.1-only')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libxfce4windowing' 'xfconf' 'libdbusmenu-gtk3'
         'hicolor-icon-theme' 'desktop-file-utils' 'gtk-layer-shell')
makedepends=('git' 'intltool' 'gobject-introspection' 'vala' 'xfce4-dev-tools')
source=(
  "git+https://gitlab.xfce.org/xfce/xfce4-panel.git#tag=$pkgname-$pkgver"
)
sha256sums=('11a7f04d2d71c99a6298ab5c70bf3e54dfc868a3aabd5a0601bedf3f144bba7b')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-x11 \
    --disable-debug \
    --enable-maintainer-mode
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
