# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yaml-cpp
pkgver=0.8.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=(x86_64 aarch64 riscv64)
license=('MIT')
provides=('libyaml-cpp.so')
makedepends=('cmake' 'ninja')
source=("https://github.com/jbeder/yaml-cpp/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"disable-wc++11-narrowing.patch")
sha512sums=('aae9d618f906117d620d63173e95572c738db518f4ff1901a06de2117d8deeb8045f554102ca0ba4735ac0c4d060153a938ef78da3e0da3406d27b8298e5f38e'
            'c219ae2466d56a484df6243b59a30f72aed82027ff7a4e02364d280c13bd4e9b599e36902436606df0d4e03affbc41fff4019d9e7ee96deec7ee6f455fe70a99')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  cmake -GNinja \
        -Bbuild \
        -DYAML_CPP_BUILD_TESTS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DYAML_BUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_LIBDIR=lib
  ninja -C build
}

check() {
  cd ${pkgname}-${pkgver}
  ninja -C build test
  build/test/yaml-cpp-tests
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -vDm 644 {CONTRIBUTING,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -rf "${pkgdir}"/usr/{lib,lib/pkgconfig,include}/*{gtest,gmock}*
  rm -rf "${pkgdir}"/usr/lib/cmake/GTest
}
