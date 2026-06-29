# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=meson-python
pkgver=0.20.0
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
sha256sums=('9adc63855f837eb8956834aa77e7b12047c77749c964f89456dbf13012cd088a')

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
  # Override a working TERM variable for testsuite, or test_output.py may fail
  TERM="ansi" test-env/bin/python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
