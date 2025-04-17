# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.24.1
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
sha512sums=('91b80c489819804d3b1cd01b481c71153c81ffacb9b15e92d9c5919596199fe5a579f4fd6722b93398a1fd02a53b14457473d766674a1130be6e9d56e80f6522'
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
