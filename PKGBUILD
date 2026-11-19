# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iniparser
pkgver=4.3.2
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
provides=('libiniparser.so')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('d76e0fcc7340cf91a667f3c620faed02')
sha256sums=('e9eb6be555c30fbef87e5a07333fcff6ef8c5bbbdc5710321bbad7ebae0612a7')

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
