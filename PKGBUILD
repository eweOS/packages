# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swayidle
pkgver=1.8.0
pkgrel=1
license=('MIT')
pkgdesc="Idle management daemon for Wayland"
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
)
depends=(
    'wayland'
)
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/swaywm/swayidle"
source=(
    "https://github.com/swaywm/swayidle/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('16b3e76a117f2f0ff2ee5fbebf38849595cdd705db1cd5f6aceaed00d71b3aa1')

build() {
    ewe-meson "$pkgname-$pkgver" build \
        -Dlogind=disabled \
        -Dman-pages=enabled
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
