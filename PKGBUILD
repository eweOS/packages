# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-rfc3987
_pyname=${pkgname#*-}
pkgver=1.3.8
pkgrel=1
pkgdesc='Parsing and validation of URIs (RFC 3896) and IRIs (RFC 3987) in Python'
url='https://codeberg.org/atufi/rfc3987/'
arch=(any)
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://codeberg.org/atufi/rfc3987/archive/v$pkgver.tar.gz")
sha256sums=('750a20d851ca8a4a815df445b08a903e6ee23a5a60be52ad316578190b462add')

build() {
	cd "$_pyname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname"
	python -m doctest -vv rfc3987.py
}

package() {
	cd "$_pyname"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
