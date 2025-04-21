# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-isoduration
_pyname=${pkgname#*-}
pkgver=20.11.0
pkgrel=1
pkgdesc='Operations with ISO 8601 durations in Python'
url='https://github.com/bolsote/isoduration'
arch=(any)
license=(ISC)
depends=(python python-arrow)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytest-benchmark
	      python-hypothesis python-isodate)
source=("https://github.com/bolsote/isoduration/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a72c92cfc3810117d2289792a39f17a0bf71a4065384ff117032fb5917e93e24')

build() {
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
	_install_license_ LICENSE
}
