# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sip
pkgver=6.8.6
pkgrel=1
arch=(any)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/'
license=(BSD-2-Clause)
depends=(python
         python-packaging
         python-setuptools)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/Python-SIP/sip#tag=$pkgver)
sha256sums=('088e9db118419831d9092650b268574b61e43f74ee12bc49591ce90c079a117a')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
