# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.11.2
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(
  libcap
)
makedepends=(
  git
  meson
  linux-headers
)
source=("git+$url#tag=v$pkgver")
sha256sums=('b272f4aade4afbb49363122f41e8f8d6be7bb7acb16dcaa86d7813134d32a6ac')

build() {
  ewe-meson $pkgname build -D selinux=disabled -D man=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

