# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tor
pkgver=0.4.9.9
pkgrel=1
pkgdesc='Anonymizing overlay network.'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://www.torproject.org/download/tor/'
license=("BSD-3-Clause" "LGPL-3.0-only" "MIT")
depends=(
  'bash'
  'libcap'
  'openssl'
  'libevent'
  'liblzma.so'
  'libseccomp.so'
  'libz.so'
  'libzstd.so'
)
optdepends=('torsocks: for torify')
makedepends=('ca-certificates' 'autoconf')
backup=('etc/tor/torrc')
source=("https://dist.torproject.org/${pkgname}-${pkgver}.tar.gz"
        "disable-openssl-dynamic-linking-warning.patch"
        'torrc.patch'
        'tor.sysusers'
        'tor.tmpfiles'
        'tor.service')
sha256sums=('bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833'
            '4067f5a6589bfaa97dd2b1a20aa73a9d3f1793bb8862c602c24b4f0cefd05dc9'
            'c5c082fd1cda30c95c40043d5be96926fa81e5388a97534373bf0ce100191ade'
            '04eec05b4e61efccc58c5da657363f0c1059d7f122cb15c32331a201af2d7f94'
            '07bedb17660a3673b31b0005b6505065c90b32f2c6b28b969241da675560f926'
            '18c01bb162aad7647f9829dc8cdc205d74a65056670f7bd669fe3491d3457682')

prepare() {
  cd ${pkgname}-${pkgver}
  # uncomment essential config sections in the torrc file
  patch -Np1 -i ../torrc.patch
  patch -Np1 -i ../disable-openssl-dynamic-linking-warning.patch

  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gpl
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/etc/tor/torrc{.sample,}

  # install custom files
  _install_sysusers_ "${srcdir}"/tor.sysusers
  _install_tmpfiles_ "${srcdir}"/tor.tmpfiles
  _dinit_install_services_ "${srcdir}"/tor.service

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
