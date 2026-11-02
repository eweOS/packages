# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-validate-pyproject
pkgver=0.27
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
sha512sums=('e0c5710a767b03c69250239efb4276eb6e47bd4975fece094b52a4c7953e9315f77743f067a010a57766cfef5fcd629dc0cc16a8b2f8624863b521fcbef63fe7'
            'c993b2a392299741a7aae175248e7fc53f7ef50fd4a0d02ffc7f8bc6916663258665c00e5c10369a777ccd32a7a5cd90da782e80ec0c1d7a02d96de816afb344'
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
