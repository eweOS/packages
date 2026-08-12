# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=neon
pkgver=0.37.1
pkgrel=1
pkgdesc='HTTP/1.1 and WebDAV client library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://notroj.github.io/neon/'
license=(LGPL-2.0-or-later)
depends=(
  ca-certificates
  expat
  krb5
  openssl
  zlib
)
makedepends=(
  docbook-xsl
  git
  xmlto
)
source=("git+https://github.com/notroj/neon.git#tag=$pkgver" musl-date-test.patch)
sha256sums=('d8fc87c968973a58f540c6472b51fffd9bc19d5aaa298787d7f3c1952359ae30'
            'a0c78eb143079cf5c2b9c2a5e452b54da94127d323189ef84588727a9891c883')

prepare() {
  _patch_ $pkgname
  
  cd $pkgname

  # Fix for autoreconf
  git cherry-pick -n 23a4e2fbb1965013fe066255cb60bb318bbfb4f6

  echo $pkgver > .version
  autoreconf -fi
  
  sed -i 's/--name//; s/--no-name//' test/Makefile.in
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-shared \
    --with-ssl=openssl \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
  make docs compile-gmo
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
