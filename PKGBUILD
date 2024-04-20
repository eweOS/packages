# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=build
pkgname=python-build
pkgver=1.2.1
pkgrel=1
pkgdesc='A simple, correct Python build frontend'
arch=('any')
url='https://github.com/pypa/build'
license=('MIT')
depends=('python' 'python-packaging' 'python-pyproject-hooks')
makedepends=(
  'git' 'python-build' 'python-flit-core' 'python-installer'
)
#checkdepends=(
#  'python-pytest' 'python-pytest-mock' 'python-pytest-rerunfailures'
#  'python-filelock' 'python-setuptools' 'python-uv' 'python-virtualenv' 'python-wheel'
#)
optdepends=(
  'python-pip: to use as the Python package installer (default)'
  'python-uv: to use as the Python package installer'
  'python-virtualenv: to use virtualenv for build isolation'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  # FIXME: missing dependency
  # PYTHONPATH=src python -m pytest -k 'not test_verbose_output' -k 'not test_external_uv_detection_success'
}

package() {
  cd $pkgname

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
