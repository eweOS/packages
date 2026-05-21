# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=hypothesis
_alt_name=$_name-python
pkgname=python-hypothesis
pkgver=6.148.2
_version=$_alt_name-$pkgver
pkgrel=2
pkgdesc="Advanced Quickcheck style testing library for Python"
arch=(any)
license=(MPL-2.0)
url="https://hypothesis.readthedocs.org"
_url="https://github.com/HypothesisWorks/hypothesis"
depends=(
  python
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
sha512sums=('bbf60e86e1cf44d30dfd5b853a3079e549b52418f21087f6cedb9cba86a95b706ab6e22d7741c503bd63d80e0f6f973c085d21040b083059e29af5fb14aed3f9')

build() {
  cd $_name-$_version/$_alt_name
  python -m build -nw
}

package() {
  cd $_name-$_version/$_alt_name
  python -m installer -d "$pkgdir" dist/*.whl
}
