# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jbigkit
pkgver=2.1
pkgrel=1
pkgdesc='Data compression library/utilities for bi-level high-resolution images'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.cl.cam.ac.uk/~mgk25/jbigkit/'
license=(GPL-2.0-or-later)
makedepends=(git)
source=(
  "git+https://www.cl.cam.ac.uk/~mgk25/git/jbigkit#tag=v$pkgver"
  jbigkit-2.1-shared_lib.patch
  jbigkit-2.1-build_warnings.patch
  jbigkit-2.1-ldflags.patch
  jbigkit-2.1-coverity.patch
  0013-new-jbig.c-limit-s-maxmem-maximum-decoded-image-size.patch
  0015-jbg_newlen-check-for-end-of-file-within-MARKER_NEWLE.patch
)
sha256sums=('73088cf6c9df66e2bbf80b6013ae164383c317a90fb07340ac96c52164cd9813'
            'cb404e8c1d67d0788368a58f2c3da83bcf5c7049139461b16c144d1018e83174'
            'e9616f9eccfa567738b0c470708d60b086b4e0c5c6017449c7f09d0ba9335e28'
            'dc44325606c1c22f075e87e81091fbf1543c6792dda311c071b0d50d7786ff17'
            '6abe6e18d830e811ff6d386e899f9a6bce1da7f5ed5613930e8e0c79d16c52ea'
            '6dcddabc07864435a3c65227309e43cb66c27e08cb33851d7a7ef123fda08e29'
            'bc3924f03446dba996a192deab7c4dddd1293ef2bcc7aef61edcbc3223fc10a0')

prepare() {
  cd $pkgname
  # instead of a static library, create a shared library
  patch -Np1 -i ../jbigkit-2.1-shared_lib.patch
  # fix build warnings
  patch -Np1 -i ../jbigkit-2.1-build_warnings.patch
  # apply distribution LDFLAGS
  patch -Np1 -i ../jbigkit-2.1-ldflags.patch
  # fix coverity issues
  patch -Np1 -i ../jbigkit-2.1-coverity.patch
  # security fixes from upstream
  patch -Np1 -i ../0013-new-jbig.c-limit-s-maxmem-maximum-decoded-image-size.patch
  patch -Np1 -i ../0015-jbg_newlen-check-for-end-of-file-within-MARKER_NEWLE.patch
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
