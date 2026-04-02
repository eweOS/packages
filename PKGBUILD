# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jsoncpp
pkgver=1.9.7
pkgrel=1
pkgdesc='C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT' 'LicenseRef-Public_Domain')
makedepends=('python' 'meson')
source=($url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('830bf352d822d8558e9d0eb19d640d2e38536b4b6699c30a4488da09d5b1df18')

build() {
  cd ${pkgname}-${pkgver}
  echo "Building shared library..."
  ewe-meson --default-library shared build
  ninja -C build
}

check() {
  cd ${pkgname}-${pkgver}
  ninja -C build test
  cd test
  python runjsontests.py ../build/jsontestrunner
  python rununittests.py ../build/jsoncpp_test
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
