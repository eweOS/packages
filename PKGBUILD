# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=c3fmt
pkgver=0.3.5
pkgrel=1
pkgdesc='A customizable code formatter for the C3 language'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/lmichaudel/c3fmt
license=(MIT)
depends=(musl tree-sitter)
makedepends=(c3c)
# 0001: Downstream, keep --version in sync with the release tag; upstream
# v0.3.5 still declares 0.3.4 in project.json.
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "0001-project-version.patch"
)
sha256sums=('a16e32e2607dfb951df5e5b8e8241f4a5c837e2f7572c52433c5361c6f29fd2a'
            '844eea33ed77746ab70b58a6bbecc7f4ec618c1ce8c64fc2bdfe6ceefb94e9c9')

prepare() {
  _patch_ "$pkgname-$pkgver"
  # The bundled x86_64 tree-sitter archive was built against glibc with
  # _FORTIFY_SOURCE and cannot link with musl; use the eweOS tree-sitter package.
  rm -f "$pkgname-$pkgver/lib/tree_sitter.c3l/linux-x64/libtree-sitter.a"
}

build() {
  cd $pkgname-$pkgver
  c3c build
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin build/$pkgname
  _install_license_ LICENSE
}
