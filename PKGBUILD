# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Tim Rühsen <tim.ruehsen@gmx.de>

pkgname=libpsl
pkgver=0.23.0
pkgrel=1
pkgdesc='Public Suffix List library'
url='https://github.com/rockdaboot/libpsl'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libidn2 libunistring)
makedepends=(libidn2 libunistring autoconf automake gtk-doc publicsuffix-list)
provides=(libpsl.so)
source=("https://github.com/rockdaboot/libpsl/releases/download/$pkgver/libpsl-$pkgver.tar.gz")
sha256sums=('f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911')

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
