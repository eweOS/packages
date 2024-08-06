# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libseccomp
pkgver=2.5.5
pkgrel=3
pkgdesc='Enhanced seccomp library'
arch=(x86_64 aarch64 riscv64)
license=('LGPL-2.1-or-later')
url="https://github.com/seccomp/libseccomp"
depends=('linux-headers')
makedepends=('gperf')
source=(https://github.com/seccomp/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375')

prepare() {
  cd ${pkgbase}-${pkgver}
  # disable test 52 since unsupported riscv64 worker kernel and qemu-user
  sed -i '/52-/d' tests/Makefile.am
  rm tests/52-*
  autoreconf -fiv
}

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_libseccomp() {
  provides=('libseccomp.so')
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 CHANGELOG README.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
