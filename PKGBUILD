# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-requests
_pyname=${pkgname#*-}
pkgver=2.32.3
pkgrel=1
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
sha256sums=('f665576fc02d02e7b7f21630b915d70c14288f48decf76fad89b16a9f3975c42')

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
