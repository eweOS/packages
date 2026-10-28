# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.13.1
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
sha256sums=('2f280da579a3a075c06324c9a9b31371e593caa3de537e387b2c25caf07567bf')

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

