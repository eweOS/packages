# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgme
pkgver=2.0.1
pkgrel=3
pkgdesc='A C wrapper library for GnuPG'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=(
  'gnupg'
  'libgpg-error'
)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('821ab0695c842eab51752a81980c92b0410c7eadd04103f791d5d2a526784966')

build() {
  cd ${pkgname}-${pkgver}

  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE" ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test
  make
}

check() {
  cd ${pkgname}-${pkgver}

  # this test fails with gnupg (FS#66572)
  sed -i 's#"t-keylist-secret",##' tests/json/t-json.c

  make check
}

package() {
  depends=('libgpg-error' 'gnupg>=2' 'libassuan')
  options+=('!emptydirs')
  provides=('libgpgme.so')

  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
