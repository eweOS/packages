# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-docutils
_pyname=${pkgname#*-}
pkgver=0.21.2
pkgrel=1
pkgdesc='An open-source text processing system for processing plaintext documentation into useful formats'
url='https://docutils.sourceforge.io/'
arch=(any)
license=(custom)
depends=(python)
optdepends=('python-pygments: for syntax highlighting')
makedepends=(python-build python-installer python-setuptools python-flit-core)
checkdepends=(python-pytest)
source=("https://sourceforge.net/projects/docutils/files/docutils/$pkgver/docutils-$pkgver.tar.gz")
sha256sums=('3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f')

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
	_install_license_ COPYING.txt
}
