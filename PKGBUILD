# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.110.2
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
sha512sums=('2386f75b91e42e20babf5fc78fcc1ed22391bfa144f318074b0efdb4a1575a6db597aa3c00e756ddea24b792f49d9d6269b6aebb8f8aa8c497e98d3bf2771749')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer -d "$pkgdir" dist/*.whl
}
