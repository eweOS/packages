# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyproject_hooks
pkgname=python-pyproject-hooks
pkgver=1.0.0
pkgrel=1
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest python-setuptools python-testpath)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('53e286cfcf8b286560cfebafe44e2162360bc1b567df2ed9019376128e14fffaafa3964f77b18487f5023aa092ede628ba5115301de42e101595f41c091d90c9')

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
