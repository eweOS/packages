# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=editorconfig-core-c
pkgver=0.12.9
pkgrel=1
pkgdesc='EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/editorconfig/editorconfig-core-c'
license=(BSD-3-Clause)
depends=(pcre2)
makedepends=(cmake git)
source=(git+https://github.com/editorconfig/$pkgname#tag=v$pkgver)
sha256sums=('d18aa56df9b9839b47e310d5dcf5b118fe2ae4e4b79ce09c17793fd8f452a1c5')

build() {
  cmake -B build -S $pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

