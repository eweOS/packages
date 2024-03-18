# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dinit-userservd
pkgver=0.1.1
pkgrel=5
pkgdesc="user dinit instance spawner + manager daemon."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/Xynonners/dinit-userservd"
license=('BSD')
depends=('dinit' 'seatd' 'pam')
source=("$pkgname::git+$url#tag=v$pkgver" 0_service-dir.patch 1_system-user-boot.patch)
makedepends=('meson' 'git')
sha256sums=('SKIP'
            'f1d230a9643dee805128af71f7c1cd263c0e16bf355ded36c8878a393b293c9b'
            '39bafcfdbebb95fad61ac897d2c7af033d233eb38375314964d7aa71ec331082')

prepare() {
  _patch_ $pkgname
  sed -i 's/elogind/seatd/' $pkgname/dinit-userservd
}

build() {
  mkdir -p build
  ewe-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  _dinit_install_services_ $pkgname/dinit-userservd
  install -d $pkgdir/usr/lib/dinit/system/greetd.d
  ln -s ../dinit-userservd $pkgdir/usr/lib/dinit/system/greetd.d/dinit-userservd
}
