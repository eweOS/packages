# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pytest-cov
_pyname=${pkgname#*-}
pkgver=7.1.0
pkgrel=1
pkgdesc='Coverage plugin for pytest'
url='https://pytest-cov.readthedocs.io/en/latest/'
arch=(any)
license=(MIT)
depends=('python' 'python-coverage' 'python-pluggy' 'python-pytest')
makedepends=('git' 'python-build' 'python-hatch-fancy-pypi-readme' 'python-hatchling' 'python-installer')
#TODO: needs virtualenv / process-tests
#checkdepends=('python-virtualenv' 'python-process-tests' 'python-pytest-xdist')
source=("https://github.com/pytest-dev/pytest-cov/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17332fbc3674a00ae5a4317b2268b6802e5537674d0ea59f473914cb796d0ef1')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	#python -m venv --system-site-packages test-env
	#test-env/bin/python -m installer dist/*.whl
	#PYTHONPATH="$PWD/tests" test-env/bin/python -m pytest
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
