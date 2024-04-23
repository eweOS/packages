# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='wlogout'
pkgver=1.2.2
pkgrel=1
pkgdesc="Logout menu for wayland"
arch=('x86_64' 'aarch64' 'riscv64')
license=("MIT")
url="https://github.com/ArtsyMacaw/wlogout"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
makedepends=("meson" "scdoc")
depends=("gtk3" "gtk-layer-shell")
sha256sums=('4c9204bfa19c73f51176c94c67711f54f3e393301c0809c61ae379054060fa46')

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
