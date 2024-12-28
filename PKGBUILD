# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.123.2
_version=$_alt_name-$pkgver
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
license=(MPL-2.0)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
depends=(
  python
  python-attrs
  python-sortedcontainers
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-black: for CLI and ghostwriter'
  'python-click: for CLI'
  'python-dateutil: for date support'
  'python-django: for django module'
  'python-dpcontracts: for contracts support'
  'python-faker: for fakefactory and django module'
  'python-lark-parser: for lark module'
  'python-libcst: for codemods module'
  'python-numpy: for numpy module'
  'python-pandas: for pandas support'
  'python-pytest: for pytest module'
  'python-pytz: for datetime and django module'
  'python-redis: for redis support'
  'python-rich: for CLI'
)
source=($_name-$_version.tar.gz::$_url/archive/$_version.tar.gz)
sha512sums=('d46b3d83a14b629a39f7eb2dcb0915802ee8185b4796ea38d053e44f2e8e4025a053c99a0aea7b4b59442a24fd3600b78d5a19e1f0bbd13e8a2d9f93cdca3df6')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer -d "$pkgdir" dist/*.whl
}
