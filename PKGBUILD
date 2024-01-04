# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dinit-userservd
pkgver=0.1.1
pkgrel=2
pkgdesc="user dinit instance spawner + manager daemon."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/Xynonners/dinit-userservd"
license=('BSD')
depends=('dinit' 'elogind')
source=("$pkgname::git+$url#tag=v$pkgver" 0_service-dir.patch)
makedepends=('meson')
sha256sums=('SKIP'
            'f1d230a9643dee805128af71f7c1cd263c0e16bf355ded36c8878a393b293c9b')

prepare() {
  _patch_ $pkgname
}

build() {
  mkdir -p build
  ewe-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  _dinit_install_services_ $pkgname/dinit-userservd
}
