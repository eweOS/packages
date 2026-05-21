# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4'
pkgname=gtk4-layer-shell
pkgver=1.3.0
pkgrel=2
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
url="https://github.com/wmww/gtk4-layer-shell"
depends=(
    "gtk4"
    "wayland"
)
makedepends=(
    "gobject-introspection"
    "meson"
    "ninja"
    "python"
    "wayland-protocols"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1ebb01ab14e98afd1727f68f64981c37bd23305b1f131f5667c02b94cf593192')

build() {
    meson setup \
          --prefix=/usr \
          --wrap-mode=nofallback \
          --buildtype=plain \
          -Dvapi=false \
          -Dsmoke-tests=false \
          "$pkgname-$pkgver" \
          build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -D -m 644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
