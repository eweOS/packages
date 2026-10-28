# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-dict
pkgver=0.8.10
pkgrel=1
pkgdesc="A dictionary plugin for the Xfce panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-dict/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'librsvg' 'hicolor-icon-theme' 'glib2')
makedepends=('git' 'meson')
source=(
  "git+https://gitlab.xfce.org/apps/xfce4-dict.git#tag=$pkgname-$pkgver"
)
sha256sums=('15dd542ae2135651634ef57fe6dd553b8aa80352bf05b36765dde3085edef9f0')

build() {
  ewe-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
