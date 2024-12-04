# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyproject-hooks
pkgname=python-pyproject-hooks
pkgver=1.2.0
pkgrel=2
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest python-setuptools python-testpath)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('c198624ca278001922e07039333aa623a87bd9ef9f38ec98346d6d49f19dec422f788f6737623b461d76586bc8fa752518906bc7501e822429803881700ce701')

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
