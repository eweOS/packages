# Maintainer: Yukari Chiba <i@0x7f.cc>

_parent_name=flit
_name=flit_core
pkgname=python-flit-core
pkgver=3.10.1
pkgrel=1
pkgdesc="A PEP 517 build backend for packages using Flit"
arch=(any)
url="https://github.com/pypa/flit/tree/main/flit_core"
_url="https://github.com/pypa/flit"
license=(BSD-3-Clause)
groups=(python-build-backend)
depends=(python)
makedepends=(
  python-build
  python-installer
)
checkdepends=(
  python-pytest
  python-testpath
)
source=($_parent_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('51f797f480102fe89cd69f3fbd91c614b2390a37659c589622f2c7938cc64bc223f710e07365766159b6833d7afdafef4461a92667b6e3ae786df5137a877ee1')

build() {
  cd $_parent_name-$pkgver/$_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_parent_name-$pkgver/$_name
  pytest -vv
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_parent_name-$pkgver/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove tests
  rm -frv "$pkgdir/$site_packages/${_name/-/_}/tests/"
  # remove vendored tomli
  rm -frv "$pkgdir/$site_packages/${_name/-/_}/vendor/"
}
