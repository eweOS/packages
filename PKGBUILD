# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jsoncpp
pkgver=1.9.7
pkgrel=3
pkgdesc='C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT' 'LicenseRef-Public_Domain')
makedepends=('python' 'meson')
# 0001: Backport, fix ABI compatibility when jsonscpp is built against earlier
#	C++ versions without string_view available, but is used in later C++
#	versions, which would fail with missing string_view-related symbols
#	https://github.com/open-source-parsers/jsoncpp/pull/1675/
source=($url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
	0001-Fix-C++11-ABI-breakage-when-compiled.patch)
sha256sums=('830bf352d822d8558e9d0eb19d640d2e38536b4b6699c30a4488da09d5b1df18'
            'b048ce249b4e1482851f18265ddb8ba41937b1a50a8a071314bd0440c56e88d4')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

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
