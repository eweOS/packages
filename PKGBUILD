# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-jsonschema-specifications
_pyname=${pkgname#*-}
pkgver=2024.10.1
pkgrel=1
pkgdesc='Support files exposing JSON from the JSON Schema specifications to Python'
url='https://jsonschema-specifications.readthedocs.io/en/latest/'
arch=(any)
license=(MIT)
depends=(python python-referencing)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-hatchling python-hatch-vcs)
checkdepends=(python-pytest)
source=("https://github.com/python-jsonschema/jsonschema-specifications/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41ebdd0657316babcf56b47fc7105e9061f20a7460b02ff54eb858868fc6f0ca')

build() {
	cd "$_pyname-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
		python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
