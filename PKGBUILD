# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.8.0
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
)
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

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

