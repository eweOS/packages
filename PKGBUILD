# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iniparser
pkgver=4.2.4
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
provides=('libiniparser.so')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('2b4b70171712895cb5afdf1247a8889f')
sha256sums=('c05bb41df87f31a029516943ebb7f38ca1f0e38ff36f3836f1163a9a529857df')

build() {
  mkdir build

  cmake \
    "${pkgname}-${pkgver}" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_DOCS=OFF
  cmake --build build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -Dm0644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/iniparser/LICENSE
}
