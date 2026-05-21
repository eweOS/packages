# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=doctest
pkgver=2.5.1
pkgrel=2
pkgdesc='The feature-rich C++11/14/17/20 single-header testing framework'
arch=('any')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4ebd26061d5a5d05355f52289c3f595d744aac8d70c547a012b2be96bc2f014')

prepare()
{
  mkdir -p $pkgname-$pkgver/build
}

build()
{
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DDOCTEST_WITH_TESTS=off \
    -G"Unix Makefiles" \
    ../
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm 0644 ../LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
