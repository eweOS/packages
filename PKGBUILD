# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-docutils
_pyname=${pkgname#*-}
pkgver=0.22.4
pkgrel=3
pkgdesc='An open-source text processing system for processing plaintext documentation into useful formats'
url='https://docutils.sourceforge.io/'
arch=(any)
license=(custom)
depends=(python)
optdepends=('python-pygments: for syntax highlighting')
makedepends=(python-build python-installer python-setuptools python-flit-core)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/d/docutils/docutils-$pkgver.tar.gz")
sha256sums=('4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968')

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
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ COPYING.rst
}
