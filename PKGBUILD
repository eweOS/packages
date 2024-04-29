# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=swaybg
pkgver=1.2.1
pkgrel=1
pkgdesc='Wallpaper tool for Wayland compositors'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/swaywm/swaybg'
license=(MIT)
makedepends=(meson ninja wayland-protocols)
depends=(wayland cairo gdk-pixbuf)
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('6af1fdf0e57b1cc5345febed786b761fea0e170943a82639f94cfaed7df84f8f')

build() {
    mkdir -p build
    ewe-meson build "$pkgname-$pkgver" -Dman-pages=disabled
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
