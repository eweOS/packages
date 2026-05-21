# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Tim Rühsen <tim.ruehsen@gmx.de>

pkgname=libpsl
pkgver=0.21.5
pkgrel=6
pkgdesc='Public Suffix List library'
url='https://github.com/rockdaboot/libpsl'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libidn2 libunistring)
makedepends=(libidn2 libunistring autoconf automake gtk-doc publicsuffix-list)
provides=(libpsl.so)
source=("https://github.com/rockdaboot/libpsl/releases/download/$pkgver/libpsl-$pkgver.tar.gz")
sha256sums=('1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -frv list
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-gtk-doc \
    --enable-{builtin,runtime}=libidn2 \
    --with-psl-file=/usr/share/publicsuffix/effective_tld_names.dat \
    --with-psl-testfile=/usr/share/publicsuffix/test_psl.txt
  LC_CTYPE=en_US.UTF-8 make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
