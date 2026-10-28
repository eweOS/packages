# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gn
pkgver=0.2610.84f10d13
_commit=84f10d13f9041068a7da8f9dfc9b991e1049823a
pkgrel=1
pkgdesc="Meta-build system that generates build files for Ninja"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gn.googlesource.com/gn/"
license=('BSD-3-Clause')
makedepends=('ninja' 'python' 'git')
source=("git+https://gn.googlesource.com/gn#commit=$_commit")
sha256sums=('218254424be7a25e1d7de7310de9652ff019d2b45903c57ae7a0b813abbc09e2')

pkgver() {
  cd $pkgname
  echo 0.$(git rev-list --count initial-commit..).$(git rev-parse --short=8 HEAD)
}

prepare() {
  _patch_ $pkgname
}

build() {
  cd $pkgname
  # Use the system clang instead of the hermetic toolchain fetched by build/gen.py.
  CXX=clang++ ./build/gen.py --no-static-libstdc++
  # Avoid developer-only formatting and documentation targets.
  ninja -C out gn gn_unittests
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
