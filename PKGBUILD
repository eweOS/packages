# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yasm
pkgver=1.3.0
pkgrel=3
pkgdesc="A rewrite of NASM to allow for multiple syntax supported (NASM, TASM, GAS, etc.)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.tortall.net/projects/yasm/"
license=('BSD-2-Clause OR BSD-3-Clause'
	 BSD-3-Clause GPL-2.0-or-later LGPL-2.1-or-later PerlArtistic)
options=('staticlibs')
depends=(musl)
# 0001: Under review, fix testsuite failures with LTO enabled
#	https://github.com/yasm/yasm/pull/289
source=(https://www.tortall.net/projects/yasm/releases/${pkgname}-${pkgver}.tar.gz
	0001-dwarf2-Correctly-initialize-dwarf2_line_info.errwarn.patch)
sha256sums=('3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f'
            '4549c5e124754eef44ff7384245c4273adda2d3f73116e74f1a82a813e331263')

prepare() {
  cp /usr/share/autoconf/build-aux/config.{guess,sub} \
    ${pkgname}-${pkgver}/config
  _patch_ ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check -j1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/BSD.txt"
}
