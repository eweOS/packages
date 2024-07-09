# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gpgme
pkgname=gpgme
pkgver=1.23.2
pkgrel=3
pkgdesc='A C wrapper library for GnuPG'
arch=(x86_64 aarch64 riscv64)
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=(
  'gnupg'
  'libgpg-error'
)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2" lfs64.patch)
sha256sums=('9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224'
            '12bebd3d827910a58d4348cd107e0698ed4bb89a2a704cae950548f10b1a0b78')

prepare() {
  _patch_ $pkgbase-$pkgver
  cd ${pkgbase}-${pkgver}/

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd ${pkgbase}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test
  make
}

check() {
  cd ${pkgbase}-${pkgver}

  # this test fails with gnupg (FS#66572)
  sed -i 's#"t-keylist-secret",##' tests/json/t-json.c

  make check
}

package() {
  depends=('libgpg-error' 'gnupg>=2' 'libassuan')
  options+=('!emptydirs')
  provides=('libgpgme.so'
            'libgpgmepp.so')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
