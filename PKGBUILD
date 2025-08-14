# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4'
pkgname=gtk4-layer-shell
pkgver=1.2.0
pkgrel=1
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
sha256sums=('4e04711fec80afbcd0a1e6e39c07ae263d2c3400181791b7826f3e5317b33567')

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
