# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pretend
pkgver=1.0.9
pkgrel=1
pkgdesc="A library for stubbing in Python"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/alex/pretend"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex/pretend/archive/v$pkgver.tar.gz")
sha512sums=('976e3272557aecfb11e4147a868ea96e23546e277d57d726f41b945103bef3451039716e6bbc5082d691fa1fd331c06b3d0f8b254deb0510948153571326eaf0')

build() {
  cd "$srcdir"/pretend-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/pretend-$pkgver
  pytest
}

package() {
  cd pretend-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}
