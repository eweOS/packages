# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.18
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL')
arch=('any')
depends=('python-packaging' 'python-fastjsonschema' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver")
sha512sums=('9316280953db8c6a43f8a2ff3e82f21862ddb998e414f20a59add23a6a7cf9be9571b6f307c4453561dbfdd5691678db7c0090cfc5ddad15fd08c0d3d9dd1c2e')

prepare() {
  cd validate-pyproject
  sed -i '/"--cov", /d' pyproject.toml
}

build() {
  cd validate-pyproject
  python -m build -wn
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd validate-pyproject
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" python -m pytest --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" python -m pytest --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject
  python -m installer --destdir="$pkgdir" dist/*.whl
}
