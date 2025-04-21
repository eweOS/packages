# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-uri-template
_pyname=${pkgname#*-}
pkgver=1.3.0
pkgrel=1
pkgdesc='A Python implementation of RFC 6570 URI Templates'
url='https://gitlab.linss.com/open-source/python/uri-template'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools
	     python-setuptools-scm python-wheel)
source=("https://gitlab.linss.com/open-source/python/uri-template/-/archive/v$pkgver/uri-template-v$pkgver.tar.gz")
sha256sums=('bb7bf9fd40f0a77393fa50390797ae2b075f894dcae74e11765e4d3e69859a09')

build() {
	cd "$_pyname-v$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
		python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-v$pkgver"
	python test.py
}

package() {
	cd "$_pyname-v$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE
}
