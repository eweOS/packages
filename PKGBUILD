# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.20.2
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-packaging' 'python-fastjsonschema' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver")
sha512sums=('33cc2ba08b78c10f49997c230d542f9a0c423bdef5d9d4583d25d73b27e4284a6b4af87d05b58c0cac23003f94de007bf4193a9ada2496da94491cb99c86f90b')

build() {
  cd validate-pyproject
  python -m build -wn
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd validate-pyproject
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject
  python -m installer --destdir="$pkgdir" dist/*.whl
}
