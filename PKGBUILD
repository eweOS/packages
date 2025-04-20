# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-layer-shell
pkgdesc="A library to create panels and other desktop components for Wayland using the Layer Shell protocol"
pkgver=0.9.1
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('43e2165cf1a9aa8a317b081c2a583648e02389162f1fbbd33836ba27f9ca19fa')

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
