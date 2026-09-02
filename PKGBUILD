# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Tim Rühsen <tim.ruehsen@gmx.de>

pkgname=libpsl
pkgver=0.23.3
pkgrel=1
pkgdesc='Public Suffix List library'
url='https://github.com/rockdaboot/libpsl'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libidn2 libunistring)
makedepends=(libidn2 libunistring autoconf automake gtk-doc publicsuffix-list)
provides=(libpsl.so)
source=("https://github.com/rockdaboot/libpsl/releases/download/$pkgver/libpsl-$pkgver.tar.gz")
sha256sums=('93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be')

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
