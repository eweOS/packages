# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=djvulibre
pkgver=3.5.28
pkgrel=1
pkgdesc='Library and utilities to create, manipulate and view DjVu (déjà vu) documents'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://djvu.sourceforge.net/'
license=(GPL-2.0-or-later)
depends=(
  bash
  hicolor-icon-theme
  libjpeg-turbo
  libtiff
)
makedepends=(git autoconf)
source=(
  "$pkgname::git+https://git.code.sf.net/p/djvu/djvulibre-git#tag=release.$pkgver"
  djvulibre-check-image-size.patch
  djvulibre-integer-overflow.patch
  djvulibre-check-input-pool.patch
  djvulibre-djvuport-stack-overflow.patch
  djvulibre-unsigned-short-overflow.patch
  djvulibre-out-of-bound-write-2.patch
  djvulibre-CVE-2021-46310.patch
  djvulibre-CVE-2021-46312.patch
)
sha256sums=('1a792f9fc9146678736855f6f9cd41b93b376c8d7dba1b3f3d4576b2daa6fccb'
            '5cd3bdedc9ba82af541e1fc0bb6fabdc77c7fc43ee6bd15f9c7cca9d39d53c82'
            '9e6d8b94d922ba382702ec4f878c06293eb546827e40a7de5221cb21c52d3d23'
            'd938cb05ac37b2f3f9602de6d148307e4164ee8a6f89fb6d81d5ed100fbc368b'
            '73e476cdb8af46bf94b208b9170679aaba165d54247d435e6a58e874ae85109c'
            '7ea0926757adaaff61b5622b2ee88d4af55fec5235183828337005852118f97f'
            'bfc2c89b86d1ab60b4fc8f48270c178269b619fee20dfeeee37ab08a1fda7432'
            '94ec83abf505a24edeabdbeac20338e880bde3b9828ab969b41acd540a2689c8'
            '2391cb6c65c2bc0f71188b05431cda4918deb9adf32a902f0fff6c2c9e3093dd')

prepare() {
  # Security fixes from Fedora and openSUSE
  _patch_ $pkgname
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  # "error: ISO C++17 does not allow 'register' storage class specifier"
  CXXFLAGS+=" -Dregister="
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
