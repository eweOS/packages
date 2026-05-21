# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.11.1
pkgrel=2
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
sha256sums=('bbbd3f98dbac8955d35c5cefce9226953a5a5b7fadbbef2ef0c8a15a9e3fd052')

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

