# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-terminal
pkgver=1.1.4
pkgrel=1
pkgdesc="A modern terminal emulator primarily for the Xfce desktop environment"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/terminal/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'vte3' 'gtk-layer-shell' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/apps/xfce4-terminal.git#tag=$pkgname-$pkgver")
sha256sums=('03750052629be5d9438f485cb85dad864291f1a1b29240fd8e61fa0061f0944a')

prepare() {
  cd $pkgname
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
}
