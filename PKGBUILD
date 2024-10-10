# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libppd
pkgver=2.0.0
pkgrel=2
pkgdesc="OpenPrinting - the legacy support library for PPD files"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/OpenPrinting/libppd"
license=('APACHE')
depends=('libcups' 'libcupsfilters')
makedepends=('ghostscript' 'autoconf' 'linux-headers')
source=(
  https://github.com/OpenPrinting/libppd/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
  fix-zlib.patch::https://github.com/OpenPrinting/libppd/commit/a040f26f3ca103c8ae7706d91ae157dca0974c49.patch
)
sha256sums=('882d3c659a336e91559de8f3c76fc26197fe6e5539d9b484a596e29a5a4e0bc8'
            '16d7a12dcc1361258264ce1f3e09e122958e9fd266422ed9c9e8b7f4d2f7228c')

prepare() {
  _patch_ "$pkgname-$pkgver"
  cd "$pkgname"-$pkgver
  # fix duplicate mkdir
  sed -i 's/-mkdir/-mkdir -p/' install-sh
  autoreconf -fiv
}

build() {
  cd "$pkgname"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool \
    --disable-pdftops
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
