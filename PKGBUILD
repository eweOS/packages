# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.25
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL-2.0')
arch=('any')
depends=('python-packaging' 'python-fastjsonschema' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=(
  "git+https://github.com/abravalheri/validate-pyproject.git#tag=v$pkgver"
  "relative-url-fix.patch::https://github.com/abravalheri/validate-pyproject/commit/fd3e7e79a0c59df66d27562199256d490cfc47f9.patch"
  "0001-fix-tests-failing-due-to-missing.patch"
  "0002-fix-duplicate-schema-ids-in-store.patch"
)
sha512sums=('9754c5d1a01a6296c5859ef69e7bb53ea4ea027902229372c245c436717a31be08ae3c6685896ca5214718a362376744874f9d41b155afc7020ac4be96335138'
            '50404234555b6afe97a73bf6aa4038a2126640fa1dd0b78061701091844c46f1941410b2063d64216b515f509f3439ef59985314eeb57cd556c1caf4a23eff56'
            '4a562557695923a1ce451a0359173ac243a61cf7f2b770e20f7530d207cbe12705688046fe066d683478c555a2b090a6fd393b2291f2e16324f2dc379a33be12'
            'fceb5498277d8c0058739dfccd50f7d55bc9f4e50664f5a9e20709ac81906c046db9ecaab54dc97362798bc9499020519803a4b2aee813e19363545f7d417cfe')

prepare() {
  # relative-url-fix: backport: https://github.com/abravalheri/validate-pyproject/pull/306
  # 0001: from archlinux: fix tests needing partial-pdm-dockerize.json schema
  # 0002: downstream: dedup schemas with same $id in load_store
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
  # Deselected tests requiring a installed validate-pyproject
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest -o addopts='' --deselect tests/test_pre_compile.py --deselect tests/test_vendoring.py
}

package() {
  cd validate-pyproject
  python -m installer --destdir="$pkgdir" dist/*.whl
}
