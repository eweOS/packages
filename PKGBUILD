# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wl-clipboard
pkgver=2.3.0
pkgrel=1
pkgdesc="Command-line copy/paste utilities for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/bugaevc/wl-clipboard"
license=('GPL3')
depends=('wayland')
optdepends=(
    'xdg-utils: for content type inference in wl-copy'
    'mailcap: for type inference in wl-paste'
)
makedepends=('meson' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugaevc/wl-clipboard/archive/v$pkgver.tar.gz")
sha256sums=('b4dc560973f0cd74e02f817ffa2fd44ba645a4f1ea94b7b9614dacc9f895f402')

build() {
    ewe-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
