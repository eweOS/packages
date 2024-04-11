# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=slurp
pkgver=1.5.0
pkgrel=1
pkgdesc='Select a region in a Wayland compositor'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/emersion/slurp"
license=('MIT')
depends=('cairo' 'wayland' 'libxkbcommon')
makedepends=('meson' 'scdoc' 'wayland-protocols')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/emersion/slurp/releases/download/v$pkgver/slurp-$pkgver.tar.gz"
)
sha256sums=('eeb282b2adc8db5614b852596340b69da6f3954cf6cfbdc4392da509c934208a')

build() {
    ewe-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    cd "$pkgname-$pkgver"
    install -Dm 0644 LICENSE -t "$pkgdir/usr/share/licenses/slurp/"
    install -Dm 0644 README.md -t "$pkgdir/usr/share/doc/slurp/"
}
