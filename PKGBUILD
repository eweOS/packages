# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-outcome
_pyname=${pkgname#*-}
pkgver=1.3.0.post0
pkgrel=1
pkgdesc='Capture the outcome of Python function calls'
url='https://outcome.readthedocs.io/en/latest/'
arch=(any)
license=("Apache-2.0 OR MIT")
depends=(python python-attrs python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytest-asyncio)
source=("https://github.com/python-trio/outcome/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19e079e05c7aed32ef7a8298d533e7394b61149c8bb46adcbbe279b5f325e172')

build () {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	PYTHONPATH="$PWD/src" pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE.{APACHE2,MIT} \
		-t "$pkgdir"/usr/share/licenses/python-outcome
}
