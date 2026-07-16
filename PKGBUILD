# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=helvum
pkgver=0.6.2
pkgrel=1
pkgdesc='GTK patchbay for PipeWire'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gitlab.freedesktop.org/pipewire/helvum'
license=(GPL-3.0-only)
depends=(
  cairo
  gdk-pixbuf
  glib
  graphene
  gtk4
  hicolor-icon-theme
  libadwaita
  pipewire
  pango
  pipewire
)
makedepends=(
  rust
  meson
)
# FIXME: no -flto arg to ld
options=(!lto)
source=($url/-/archive/$pkgver/helvum-$pkgver.tar.gz)
sha512sums=('0c1fd8d1c8081f8e6a3ef3db4f7e74e211a41b7d3c6bf3ef7fa9da714bd0b31f9778376c56147c8ee623fd7c62c073e21d07b3f832c40f9f3dd47d9e65ed0a20')

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
