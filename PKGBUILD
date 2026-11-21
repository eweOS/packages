# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libqalculate
pkgver=5.13.2
pkgrel=1
pkgdesc='Multi-purpose desktop calculator'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(curl
         icu
         gmp
         libxml2
         mpfr
         readline)
makedepends=(doxygen)
optdepends=('gnuplot: for plotting support')
# 0001: Downstream, gettext-tiny's msgfmt does not implement XML mode. Keep NLS
# for translated qalc messages; install the data definitions untranslated.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qalculate/libqalculate/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "0001-gettext-tiny-copy-xml-templates.patch")
sha256sums=('81af6c54018d5cbc9ce4df5a82c3ffb7b195193d72dcabb904f522b69936f3e6'
            '0410b7b4a2e2d79bdd9d278e17ebbaf7eb63ebd310409291b25d11dd4bd85671')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ "$srcdir/$pkgname-$pkgver/COPYING"
}
