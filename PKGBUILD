# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libseccomp
pkgver=2.6.1
pkgrel=1
pkgdesc='Enhanced seccomp library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later')
url="https://github.com/seccomp/libseccomp"
depends=('linux-headers')
makedepends=('gperf')
# 0001: Downstream, workaround missing "--pid" option of tail
source=("https://github.com/seccomp/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"0001-tests-Workaround-busybox-tail.patch")
sha256sums=('501f66c667225d53791b97e1d7cf85ab764c297d04881f60f38f451c4b0ee1be'
            '2dc7b4e067650185cc7654d7ffc147daec0d8134d2b0142500d6b43a75dfea71')

prepare() {
  _patch_ ${pkgbase}-${pkgver}
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
