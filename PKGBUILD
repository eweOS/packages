# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-rfc3339-validator
_pyname=${pkgname#*-}
pkgver=0.1.4
pkgrel=1
pkgdesc='An RFC3339 validator in pure Python'
url='https://github.com/naimetti/rfc3339-validator'
arch=(any)
license=(MIT)
depends=(python python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-strict-rfc3339 python-hypothesis)
source=("https://github.com/naimetti/rfc3339-validator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('094e630652349573979b66439e928f19dfe08c3ada378ec12589a9c1a0f188c9')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	PYTHONPATH="$PWD" pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
