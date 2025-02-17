# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iniparser
pkgver=4.2.6
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
provides=('libiniparser.so')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('225e439bf6940377b7a334b4befa1b18')
sha256sums=('a0bd370713a744b1fa8ec27bba889ebf9dbd43060ec92e07fbe91fb43e3cb3ac')

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
