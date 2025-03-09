# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-decorator
pkgver=5.2.1
pkgrel=1
pkgdesc='Decorators for Humans.'
url='https://github.com/micheles/decorator'
arch=(any)
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://github.com/micheles/decorator/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a51ac0dfff84270a5405621e5b9d8734411b5403b5e6d0d0b7a8cbae731f633a')

build () {
	cd "decorator-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "decorator-$pkgver"
	PYTHONPATH="$PWD/src" python tests/test.py -vv
}

package() {
	cd "decorator-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE.txt
}
