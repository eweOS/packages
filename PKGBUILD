# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkcs11-helper
pkgver=1.30.0
pkgrel=2
pkgdesc='A library that simplifies the interaction with PKCS11 providers for end-user applications using a simple API and optional OpenSSL engine'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/OpenSC/pkcs11-helper'
license=('GPL' 'BSD')
depends=('nss' 'openssl')
provides=('libpkcs11-helper.so')
source=("https://github.com/OpenSC/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4c5815ba910cabf26df08d449ca2909daf4538c9899aa7f7fadc61229d3488a9')

build() {
  cd pkcs11-helper-$pkgver

  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoreconf -v
  ./configure --prefix=/usr
  make
}

package() {
  cd pkcs11-helper-$pkgver

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -D -m0644 COPYING* "$pkgdir"/usr/share/licenses/$pkgname/
}

