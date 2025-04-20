# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-simplejson
_pyname=${pkgname#*-}
pkgver=3.20.1
pkgrel=1
pkgdesc='A simple, fast, extensible JSON encoder/decoder for Python'
url='https://simplejson.readthedocs.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=("MIT OR LicenseRef-Academic-Free-License-v2.1")
depends=(python musl)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/simplejson/simplejson/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('892eda48a39017ba1545ff4ed3290f5fa38e5b171944169cfaf7260a51b0076a')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	pytest -v
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE.txt
}
