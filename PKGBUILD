# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgme
pkgver=2.3.1
pkgrel=1
pkgdesc='A C wrapper library for GnuPG'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=(
  'gnupg'
  'libgpg-error'
)
# 0001: Downstream, link pinentry with LDFLAGS for LTO/mold.
# TODO: upstream.
source=(
  "https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
  "0001-pinentry-link-with-ldflags.patch"
)
sha256sums=('2bf94e0e677e5a8fc31f79dd323f91c5416b36fb851058bc1e8bce39f2642434'
            '924a9d348a8856e9c24394ec11bf7c0ab8911bdecce17aff6eae1aa69eef73ea')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

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
