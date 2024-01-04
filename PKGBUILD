# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dinit-userservd
pkgver=0.1.1
pkgrel=1
pkgdesc="user dinit instance spawner + manager daemon."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/Xynonners/dinit-userservd"
license=('BSD')
depends=('dinit' 'elogind')
source=("$pkgname::git+$url#tag=v$pkgver")
makedepends=('meson')

build() {
    mkdir -p build
    ewe-meson $pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
sha256sums=('SKIP')
