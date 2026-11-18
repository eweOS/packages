# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgme
pkgver=2.2.0
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
sha256sums=('7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b2f3acf0496977b'
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
