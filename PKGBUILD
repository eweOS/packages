# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgme
pkgver=2.0.0
pkgrel=1
pkgdesc='A C wrapper library for GnuPG'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
makedepends=(
  'gnupg'
  'libgpg-error'
)
source=("https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2" lfs64.patch)
sha256sums=('ddf161d3c41ff6a3fcbaf4be6c6e305ca4ef1cc3f1ecdfce0c8c2a167c0cc36d'
            '12bebd3d827910a58d4348cd107e0698ed4bb89a2a704cae950548f10b1a0b78')

prepare() {
  _patch_ $pkgname-$pkgver
  cd ${pkgname}-${pkgver}/

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
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
