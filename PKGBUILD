# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgme
pkgver=2.1.2
pkgrel=1
pkgdesc='A C wrapper library for GnuPG'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=(
  'gnupg'
  'libgpg-error'
)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77')

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
