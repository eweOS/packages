# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=helvum
pkgver=0.5.1
pkgrel=1
pkgdesc='GTK patchbay for PipeWire'
arch=(x86_64 aarch64 riscv64)
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
sha512sums=('7d4655a32d0c35c4bcc4164f8bc08654be08613d488a12ec237ef7757242ebd3ca6bc944eb757a234080187eec2c9b558bdba228e8e1a9d9e670c1620f5bb4d1')

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
