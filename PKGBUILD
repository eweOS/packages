# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libseccomp
pkgver=2.5.5
pkgrel=6
pkgdesc='Enhanced seccomp library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later')
url="https://github.com/seccomp/libseccomp"
depends=('linux-headers')
makedepends=('gperf')
# 0001, 0002: drop when libseccomp releases loongarch64 support
# 0002: LoongArch kernel reintroduces fstat syscall in 6.12, we should keep
# tests and syscall definitions in sync.
source=(
  https://github.com/seccomp/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  0001-loongarch64-support.patch::https://github.com/matoro/libseccomp/compare/v2.5.5..loongarch-r1.patch
  0002-add-fstat-syscallnum-on-loongarch64.patch
)
sha256sums=('248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375'
            '0251a01a0ab047a9d9625003de12e95ca8fb9949887bf47987468478f599b4ee'
            '5fc53929e09070a9677b389d836c55cf60fe3db3b7cdbcb22d88eab5ad970a74')

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
