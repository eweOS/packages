# Maintainer: Yukari Chiba <i@0x7f.cc>

_parent_name=flit
_name=flit_core
pkgname=python-flit-core
pkgver=3.9.0
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
sha512sums=('1218756afcb79af1df0020548102ba29245a9fa998d332357a2a6a2b7b543dda835918f4811ba343e86e1f7c6b45a6dcafe26f8e905c1e49734141f7d4e9f4fc')

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
