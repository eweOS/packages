# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-docutils
_pyname=${pkgname#*-}
pkgver=0.22.3
pkgrel=1
pkgdesc='An open-source text processing system for processing plaintext documentation into useful formats'
url='https://docutils.sourceforge.io/'
arch=(any)
license=(custom)
depends=(python)
optdepends=('python-pygments: for syntax highlighting')
makedepends=(python-build python-installer python-setuptools python-flit-core)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/d/docutils/docutils-$pkgver.tar.gz")
sha256sums=('21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd')

build () {
	cd $_pyname-$pkgver
	python -m build --wheel --no-isolation
}

# missing python-pillow
# check() {
#	cd $_pyname-$pkgver
#	pytest -v
# }

package() {
	cd $_pyname-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
	_install_license_ COPYING.rst
}
