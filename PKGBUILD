# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.10.0
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('96245c818e9533927863ba1cec173fdbd3dd9759e86861aaee843bb90c4fd0d7')

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

