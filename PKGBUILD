# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-requests
_pyname=${pkgname#*-}
pkgver=2.32.5
pkgrel=2
pkgdesc='An elegant and simple HTTP library for Python, built for human beings.'
url='https://requests.readthedocs.io'
arch=(any)
license=(Apache-2.0)
depends=(python ca-certificates python-charset-normalizer python-idna
	 python-urllib3 python-certifi)
optdepends=('python-chardet: alternative character encoding library'
	    'python-pysocks: SOCKS proxy support')
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytest-httpbin python-trustme)
source=("https://github.com/psf/requests/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f22e7e83030dbd2685fa0a9bdf0e4efd30b1424b92ff19eb66599decce510a66')

build () {
	cd $_pyname-$pkgver
	python -m build --wheel --no-isolation
}

# missing python-pytest-httpbin python-trustme
# check() {
# 	cd $_pyname-$pkgver
#	pytest -v
# }

package() {
	cd $_pyname-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ LICENSE
}
