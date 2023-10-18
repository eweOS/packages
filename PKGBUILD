# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='wlogout'
pkgver=1.1.1
pkgrel=2
pkgdesc="Logout menu for wayland"
arch=('x86_64' 'aarch64' 'riscv64')
license=("MIT")
url="https://github.com/ArtsyMacaw/wlogout"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
makedepends=("meson" "scdoc")
depends=("gtk3" "gobject-introspection" "gtk-layer-shell")
sha256sums=('cc79c9e2ff1bd225b051a34ccb352bcf8a1991b83414a7db623fce7c49566940')

prepare() {
    cd $pkgname-$pkgver
    # Use elogind instead of systemd
    sed -i 's/systemd/loginctl/g' layout
}

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
