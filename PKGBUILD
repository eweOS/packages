# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-layer-shell
pkgdesc="Library to create Wayland desktop components using the Layer Shell protocol"
pkgver=0.9.2
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-or-later)
url="https://github.com/wmww/gtk-layer-shell"
depends=(
  "gtk3"
  "wayland"
)
makedepends=(
  "gobject-introspection"
  "meson"
  "ninja"
  "wayland-protocols"
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('526dd95c083e2a73eafd8baa1f5d676a36cb80fc8e7b304cbe3efebd62f0600c')

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
