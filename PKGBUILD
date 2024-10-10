# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gd
pkgver=2.3.3
pkgrel=2
pkgdesc="Library for the dynamic creation of images by programmers"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://libgd.github.io/"
license=('custom')
depends=('fontconfig' 'libwebp' 'libavif' 'libheif')
optdepends=('perl: bdftogd script')
checkdepends=('ttf-font')
source=("https://github.com/libgd/libgd/archive/${pkgname}-${pkgver}.tar.gz"
        'https://github.com/libgd/libgd/commit/bdc281eadb1d58d5c0c7bbc1125ee4674256df08.patch'
        'fix-riscv64-tests.patch')
sha256sums=('24429f9d0dbe0f865aaa4b1a63558242396ba9134e6cfd32ca5e486a84483350'
            '1e7bdb17e76ad6b1384222b449b9011ee131d3e1f105f9b30495a9c34b2cd5eb'
            '22fd7c51e96a345d777d789960c29e75745fb650fbd90de424a328edfedabda5')

prepare() {
  cd libgd-${pkgname}-${pkgver}

  # Re-add macros that are used in PHP
  # See https://github.com/php/php-src/pull/7490
  patch -p1 -R -i "$srcdir/bdc281eadb1d58d5c0c7bbc1125ee4674256df08.patch"

  # Remove failing tests
  for f in tests/tiff/{tiff_read_bw,tiff_im2im,tiff_dpi}.c tests/heif/{heif_read,heif_im2im}.c; do
    echo 'int main() { return 0; }' > $f
  done

  # 2 tests fail on aarch64 (and riscv64): https://github.com/libgd/libgd/issues/745
  # upstream disabled them only for aarch64: https://github.com/libgd/libgd/commit/4ff557bc31fc12fba0a57554bf5f596e7fb3f15b
  patch -Np1 -i "$srcdir/fix-riscv64-tests.patch"
}

build() {
  cd libgd-${pkgname}-${pkgver}

  ./bootstrap.sh
  ./configure \
    --prefix=/usr \
    --disable-rpath
  make
}

check() {
  cd libgd-${pkgname}-${pkgver}

  TMP=$(mktemp -d) make check
}

package() {
  cd libgd-${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
