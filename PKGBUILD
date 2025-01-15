# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.23
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL-2.0')
arch=('any')
depends=('python-packaging' 'python-fastjsonschema' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
# 0001: https://github.com/abravalheri/validate-pyproject/pull/225
#	Fix tests failing due to missing partial-pdm-dockerize.json schema
source=("git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver"
	"0001-fix-tests-failing-due-to-missing.patch")
sha512sums=('f4497c1da0bf9097d4daf69c406e0eee973d67b6803e1b8052ecb1e3d8f5a800d48db5999b97b652c9e3ce1fd2b201df87a1141c31399f22d6787b9b482eac94'
            '4a562557695923a1ce451a0359173ac243a61cf7f2b770e20f7530d207cbe12705688046fe066d683478c555a2b090a6fd393b2291f2e16324f2dc379a33be12')

prepare() {
  _patch_ validate-pyproject
}

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
