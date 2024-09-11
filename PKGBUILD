# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-layer-shell
pkgdesc="A library to create panels and other desktop components for Wayland using the Layer Shell protocol"
pkgver=0.9.0
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
sha256sums=('3809e5565d9ed02e44bb73787ff218523e8760fef65830afe60ea7322e22da1c')

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
