# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=iniparser
pkgver=4.2.5
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
provides=('libiniparser.so')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('c45250cab6d628da3adf97c047bf2939')
sha256sums=('b388af84fa33a4515715a22e59d24b284b0bf895398b5e52a4a4e6fd9f76cdf8')

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
