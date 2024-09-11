# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4'
pkgname=gtk4-layer-shell
pkgver=1.0.3
pkgrel=1
arch=(x86_64 aarch64 riscv64)
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d669c30b3dbc68ad69ade9752e6ebbe7be132db21a5a4734d42bc09c5481c34')

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
