# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pyqt-builder
pkgver=1.21.0
pkgrel=1
pkgdesc='The PEP 517 compliant PyQt build system'
arch=(any)
url='https://pypi.org/project/PyQt-builder/'
license=(BSD-2-Clause)
depends=(python
         python-packaging
         sip)
makedepends=(git
             python-build
             python-installer
             python-setuptools-scm
             python-wheel)
source=(git+https://github.com/Python-PyQt/PyQt-builder#tag=$pkgver)
sha256sums=('dc7313df539136631ce7bf96394e9a75e1c1016f0ccb8d7c922d3baf8c079b07')

build() {
  cd PyQt-builder
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

package() {
  cd PyQt-builder
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
