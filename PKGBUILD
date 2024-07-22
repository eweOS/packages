# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyproject-hooks
pkgname=python-pyproject-hooks
pkgver=1.1.0
pkgrel=1
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest python-setuptools python-testpath)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('256028d13adbe35126a63431a2a49e0c48adddce5ffc3ff2eebad368eee7ce52591ecfd8a8526876de20bc59dfc87156533d6a97b55538a739873e60f9509eff')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD/src:$PYTHONPATH"
  python -m pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
