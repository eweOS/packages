# Maintainer : Yukari Chiba <i@0x7f.cc>

pkgname=connman
pkgver=1.45
pkgrel=1
pkgdesc="Intel's modular network connection manager"
url="https://01.org/connman"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later')
depends=('dbus' 'glib' 'nftables')
optdepends=('wpa_supplicant: for wireless network support')
makedepends=('wpa_supplicant' 'linux-headers')
source=(
  "${pkgname}-${pkgver}.tar.xz::https://www.kernel.org/pub/linux/network/${pkgname}/${pkgname}-${pkgver}.tar.xz"
  musl-res-ninit.patch
  connman.service
  0001-remove-no-undefined-from-plugins-LDFLAGS.patch
)
sha256sums=('77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913'
            '9b006bcf19c461d298d61ee8015263063197c7480c0bf629b9c7ad34bcffbb53'
            'f6476589934bec28a1697dc9a6265d4fc2d0462fd8866ae31bbc6478c087a037'
            '89f3540f68c91c94a77a450abfd2d6570d5cca44425f75da815b1b6ac04a0346')
options=(emptydirs)

prepare() {
  _patch_ "${pkgname}-${pkgver}"

  cd "${pkgname}-${pkgver}"
  sed -i '1s/^/#include<stdio.h>\n/' src/dnsproxy.c
  sed -i '1s/^/#include <libgen.h>\n/' src/log.c
  autoreconf -iv
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --enable-client \
      --enable-nmcompat \
      --enable-test \
      --with-firewall=nftables \
      --disable-wispr
  make
}

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/main.conf" "${pkgdir}/etc/connman/main.conf"
  install -d $pkgdir/usr/lib/dinit.d/connman.d
  _dinit_install_services_ connman.service
}
