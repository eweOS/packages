# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson-python
pkgver=0.16.0
pkgrel=1
pkgdesc='Meson PEP 517 Python build backend'
arch=(any)
url='https://github.com/mesonbuild/meson-python'
license=(MIT)
depends=(meson
         patchelf
         python
         python-packaging
         python-pyproject-metadata)
makedepends=(git
             ninja
             python-build
             python-installer)
optdepends=('python-colorama: colored output')
checkdepends=(cython
              python-gitpython
              python-pytest
              python-pytest-mock
              python-wheel)
source=(git+https://github.com/mesonbuild/meson-python#tag=$pkgver)
sha256sums=('d9c3187d2152d2fa53e41b4d9b419aadd4f77417282643f331e8dbd876fa245c')

prepare() {
  cd $pkgname
  sed -e '/ninja/d' -i pyproject.toml
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k "not test_missing_version and not test_pep621"
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
