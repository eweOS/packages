# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='A library to create panels and other desktop components for Wayland using the Layer Shell protocol and GTK4'
pkgname=gtk4-layer-shell
pkgver=1.0.4
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
    "wayland-protocols"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7fe327dc3740e4b6f5edfd855e23f84b1ac1ec6854b731047b95df7feb46498b')

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
