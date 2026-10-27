# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jbigkit
pkgver=2.2
pkgrel=1
pkgdesc='Data compression library/utilities for bi-level high-resolution images'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.cl.cam.ac.uk/~mgk25/jbigkit/'
license=(GPL-2.0-or-later)
makedepends=(git)
# 0001: Downstream, from Arch Linux, build shared libraries instead of the upstream static libraries
# 0002: Downstream, skip groff-generated text documentation that is not packaged
source=(
  "git+https://www.cl.cam.ac.uk/~mgk25/git/jbigkit#tag=v$pkgver"
  0001-build-shared-libraries.patch
  0002-skip-generated-text-docs.patch
)
sha256sums=('e392f35dd41d038dd30d5227456941eec1908dc33f220be011ed5252a051f884'
            '396c307f669bcfe841f7fb3484011cc9076536c37c4a227592ac3504c4cf9d37'
            'c97d85438291765013b6671d4bbc0da3b8ad26230236d1f1a0a526fb696c11ef')

prepare() {
  cd "$pkgname"
  _patch_ "$pkgname"
}

build() {
  cd $pkgname
  make EXTRA_CFLAGS="$CFLAGS"
}

check() {
  cd $pkgname
  # NOTE: tests can not be parallelized
  make test -j1
}

package() {
  cd $pkgname
  install -vDm 644 libjbig/*.h -t "$pkgdir/usr/include/"
  install -vDm 755 libjbig/*.so.* -t "$pkgdir/usr/lib/"
  for lib in libjbig.so libjbig85.so; do
    ln -sv "$lib.$pkgver" "$pkgdir/usr/lib/$lib"
  done
  install -vDm 755 pbmtools/{jbgtopbm{,85},pbmtojbg{,85}} -t "$pkgdir/usr/bin/"
  install -vDm 644 pbmtools/*.1* -t "$pkgdir/usr/share/man/man1/"
}
