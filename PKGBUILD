# Maintainer: Yukari Chiba <i@0x7f.cc>

_parent_name=flit
_name=flit_core
pkgname=python-flit-core
pkgver=3.11.0
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
sha512sums=('99ebec876ee9607b4fc8803719a5e62716bd48df3d2704f4d8cf99504421ec5068c4c59947a1b6f2d1e7e2a714e39e50b30385e04bb14c52c271e1dcadd8b6b5')

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
