# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cups-filters
pkgver=2.0.0
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
sha256sums=('b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2aa0127b44de800d8')

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
