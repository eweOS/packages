# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=inflect
pkgname=python-inflect
pkgver=7.3.1
pkgrel=1
pkgdesc="Correctly generate plurals, singular nouns, ordinals, indefinite articles"
arch=(any)
url="https://github.com/jaraco/inflect"
license=(MIT)
depends=(
  python
  python-more-itertools
  python-typing_extensions
  python-typeguard
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools-scm
  python-toml
)
checkdepends=(
  python-pytest
  python-pytest-enabler
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('119552b30632cf06331ac6186af262a02df85921bc650c7dba6b4abb2e02de314c58f50af97198c75658e7203fbb3b80b0bc19a95afa1bb1ae215ffe560e1593')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests: https://github.com/jaraco/inflect/issues/208
    --deselect tests/test_inflections.py::test_many
    --deselect tests/test_pwd.py::Test::test_pl
    --deselect tests/test_pwd.py::Test::test__pl_special_verb
    --deselect tests/test_pwd.py::Test::test_a_alt
  )

  cd $_name-$pkgver
  python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
