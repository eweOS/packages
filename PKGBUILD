# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-terminal
pkgver=1.2.0
pkgrel=1
pkgdesc="A modern terminal emulator primarily for the Xfce desktop environment"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/terminal/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'vte3' 'gtk-layer-shell' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'libxslt' 'docbook-xsl')
source=("git+https://gitlab.xfce.org/apps/xfce4-terminal.git#tag=$pkgname-$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    -Dbuildtype=release
  meson compile -C build
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
}
