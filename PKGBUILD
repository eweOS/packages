# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gn
pkgver=0.2174.b3a0bff4
_commit=b3a0bff47dd81073bfe67a402971bad92e4f2423
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://gn.googlesource.com/gn/"
license=('BSD')
makedepends=('ninja' 'python' 'git')
source=("git+https://gn.googlesource.com/gn#commit=$_commit" lfs64.patch)
sha256sums=('63edc92709366f6df536fe73b4c3c10390c2507258ab863215fd1f205f560abc'
            'f9247da898ae6236d0a52d3cf6a88b40bfb80e34751b941bed6418158b57b0d7')

pkgver() {
  cd $pkgname
  echo 0.$(git rev-list --count initial-commit..).$(git rev-parse --short=8 HEAD)
}

prepare() {
  _patch_ $pkgname
}

build() {
  cd $pkgname
  ./build/gen.py --no-static-libstdc++
  ninja -C out
}

check() {
  cd $pkgname
  ./out/gn_unittests
}

package() {
  cd $pkgname
  install -D out/gn "$pkgdir/usr/bin/gn"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r misc/vim/{autoload,ftdetect,ftplugin,syntax} \
    "$pkgdir/usr/share/vim/vimfiles/"
  install -Dm644 -t "$pkgdir/usr/share/emacs/site-lisp" misc/emacs/gn-mode.el
}
