# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cups-filters
pkgver=2.0.1
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters"
arch=(x86_64 aarch64 riscv64)
url="https://wiki.linuxfoundation.org/openprinting/cups-filters"
license=('custom')
depends=('libcups'
         'libcupsfilters'
         'libppd')
makedepends=('ghostscript')
source=(https://github.com/OpenPrinting/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('39e71de3ce06762b342749f1dc7cba6817738f7bf4d322c1bb9ab10b8569ab80')

prepare() {
  cd "$pkgname"-$pkgver
  # avoid duplicate mkdir
  sed -i 's/-mkdir/-mkdir -p/' install-sh
}

build() {
  cd "$pkgname"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool \
    --disable-avahi
  make
}

check() {
  cd "$pkgname"-$pkgver
  make check
}

package() {
  cd "$pkgname"-$pkgver
  make DESTDIR="$pkgdir/" install

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
