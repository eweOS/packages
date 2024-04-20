# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='wlogout'
pkgver=1.2.1
pkgrel=1
pkgdesc="Logout menu for wayland"
arch=('x86_64' 'aarch64' 'riscv64')
license=("MIT")
url="https://github.com/ArtsyMacaw/wlogout"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
makedepends=("meson" "scdoc")
depends=("gtk3" "gtk-layer-shell")
sha256sums=('ceb64ada0cd16d7a2603f65dd5e1c4ab15837dc84ff1541de10d3f49637be243')

build() {
    ewe-meson build $pkgname-$pkgver
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
