# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nmap
pkgver=7.98
pkgrel=1
pkgdesc='Utility for network discovery and security auditing'
url='https://nmap.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LicenseRef-Nmap-Public-Source-License-Version-0.95)
depends=(
  libpcap
  libssh2
  libssh2.so
  lua54
  openssl
  pcre2
  zlib
)
makedepends=(linux-headers)
source=(
  "https://nmap.org/dist/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=('ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6')

prepare() {
  cd "${pkgname}-${pkgver}"
  # fix duplicate mkdir
  sed -i 's/mkdir/mkdir -p/' ncat/mkinstalldirs
  # ensure we build devendored deps
  rm -rf liblua libpcap libpcre macosx mwin32 libssh2 libz
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  # configure script can not find lua dir correctly
  export LDFLAGS="-llua-5.4 $LDFLAGS"
  ./configure \
    --prefix=/usr \
    --with-libpcap=/usr \
    --with-libpcre=/usr \
    --with-zlib=/usr \
    --with-libssh2=/usr \
    --with-liblua=/usr \
    --without-ndiff \
    --without-zenmap
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md docs/nmap.usage.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE docs/3rd-party-licenses.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
