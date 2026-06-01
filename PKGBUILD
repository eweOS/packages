# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=editorconfig-core-c
pkgver=0.12.11
pkgrel=1
pkgdesc='EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/editorconfig/editorconfig-core-c'
license=(BSD-3-Clause)
depends=(pcre2)
makedepends=(cmake git)
source=(git+https://github.com/editorconfig/$pkgname#tag=v$pkgver)
sha256sums=('fee3ac0305ed291e2a7d39d9979be1b4fe4f971350dcf4ee76b1d26f9e44de22')

build() {
  cmake -B build -S $pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

