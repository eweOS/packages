# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bubblewrap
pkgver=0.13.0
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
sha256sums=('4941af6d0663a89e4918a9f8b833d585b6672fec7707c2c8194d72cf18c4704c')

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

