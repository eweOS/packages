# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dinit-userservd
pkgver=0.1.1
pkgrel=2
pkgdesc="user dinit instance spawner + manager daemon."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/Xynonners/dinit-userservd"
license=('BSD')
depends=('dinit' 'elogind')
source=("$pkgname::git+$url#tag=v$pkgver")
makedepends=('meson')
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  cp dinit-userservd dinit-userservd.service
}

build() {
  mkdir -p build
  ewe-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  _dinit_install_services_ $pkgname/dinit-userservd.service
}
