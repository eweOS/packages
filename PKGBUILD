# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyproject-hooks
pkgname=python-pyproject-hooks
pkgver=1.3.3
pkgrel=1
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest python-setuptools python-testpath)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('866d7c9092202adddc3a6f19856fb34191daf0455bc1abf8bdbabb32d1fc386daa5eaf3a3c5124c5000e2b0b0c70cf51b97c9a02a31c853a7f0bf4ebed2eb1ea')

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
