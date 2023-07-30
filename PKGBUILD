# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-layer-shell
pkgdesc="A library to create panels and other desktop components for Wayland using the Layer Shell protocol"
pkgver=0.8.0
pkgrel=1
arch=(x86_64 aarch64 riscv64)
license=(GPL3 LGPL3 MIT)
url="https://github.com/wmww/gtk-layer-shell"
depends=(
  "gtk3"
  "wayland"
)
makedepends=(
  "gobject-introspection"
  "meson"
  "ninja"
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('e95a03766302fe330ec3c6ff3e8018642849003ccaf160fb6fd0c039c81fa54c')

build()
{
  meson --prefix=/usr \
    --wrap-mode=nofallback \
    --buildtype=plain \
    -Dintrospection=true \
    -Dvapi=false \
    "$pkgname-$pkgver" \
    build
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" ninja -C build install
}
