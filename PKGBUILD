# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-strict-rfc3339
_pyname=${pkgname#*-}
pkgver=0.7
pkgrel=1
pkgdesc='Strict, simple, lightweight RFC3339 functions in Python'
url='https://github.com/danielrichman/strict-rfc3339'
arch=(any)
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(tzdata)
source=("https://github.com/danielrichman/strict-rfc3339/archive/refs/tags/version-$pkgver.tar.gz")
sha256sums=('a78941333384514bb6d60b789b7bf6d1d628215e9e22b7d93411701b244217bb')

build() {
	cd "$_pyname-version-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-version-$pkgver"
	python test_strict_rfc3339.py -vv
}

package() {
	cd "$_pyname-version-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
