# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=swaybg
pkgver=1.2.2
pkgrel=1
pkgdesc='Wallpaper tool for Wayland compositors'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/swaywm/swaybg'
license=(MIT)
makedepends=(meson ninja wayland-protocols)
depends=(wayland cairo gdk-pixbuf)
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('a6652a0060a0bea3c3318d9d03b6dddac34f6aeca01b883eef9e58281f5202a1')

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
