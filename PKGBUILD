# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.27
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL-2.0' 'MIT')
arch=('any')
depends=('python' 'python-packaging' 'python-fastjsonschema' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
# 0001: Downstream, from Arch Linux, support the "double" format used by Ruff's SchemaStore schema
source=(
  "git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver"
  "0001-double-format.patch"
)
sha512sums=('e0c5710a767b03c69250239efb4276eb6e47bd4975fece094b52a4c7953e9315f77743f067a010a57766cfef5fcd629dc0cc16a8b2f8624863b521fcbef63fe7'
            '561ae2260c8c1b6618b3e90c6db2e51385d7b4908f841221f336dd99b1663c5b171595222f6af4f099fabe907b707e9c1512bf66b433d4e90f7f8c9f18bb1b6d')

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

  # Pre-cache remote schemas to avoid network failures during tests
  export VALIDATE_PYPROJECT_CACHE_REMOTE="$PWD/.schema_cache"
  mkdir -p "$VALIDATE_PYPROJECT_CACHE_REMOTE"
  python tools/cache_urls_for_tests.py || true

  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --doctest-modules --ignore src/validate_pyproject/_vendor src
  # Deselected tests requiring an installed validate-pyproject
  # python-repo-review is not packaged in eweOS and 0.27 removed the fallback
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' \
    --deselect tests/test_pre_compile.py \
    --deselect tests/test_vendoring.py \
    --deselect tests/test_repo_review.py
}

package() {
  cd validate-pyproject
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ "$srcdir/validate-pyproject/LICENSE.txt" LICENSE.txt
  _install_license_ "$srcdir/validate-pyproject/NOTICE.txt" NOTICE.txt
}
