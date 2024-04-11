# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wl-clipboard
pkgver=2.2.1
pkgrel=1
pkgdesc="Command-line copy/paste utilities for Wayland"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/bugaevc/wl-clipboard"
license=('GPL3')
depends=('wayland')
optdepends=(
    'xdg-utils: for content type inference in wl-copy'
    'mailcap: for type inference in wl-paste'
)
makedepends=('meson' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugaevc/wl-clipboard/archive/v$pkgver.tar.gz")
sha256sums=('6eb8081207fb5581d1d82c4bcd9587205a31a3d47bea3ebeb7f41aa1143783eb')

build() {
    ewe-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
