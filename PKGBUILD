# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-layer-shell
pkgdesc="Library to create Wayland desktop components using the Layer Shell protocol"
pkgver=0.10.1
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
sha256sums=('88c3a3e0a5300532f3d368d5df64838a87f1fb85273f22d41df0a6b8d0ec59c6')

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
