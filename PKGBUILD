# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.5.1
pkgrel=1
pkgdesc='Python and tab completion, better together.'
url='https://kislyuk.github.io/argcomplete/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm git)
# checkdepends=(python-pytest)
source=("git+https://github.com/kislyuk/argcomplete.git#tag=v$pkgver")
sha256sums=('bc845a30fbd03ec106b39971dcb79d3a148617803b039015337591a2af0d9935')

build () {
	cd argcomplete
	python -m build --wheel --no-isolation
}

check() {
	cd argcomplete
	# missing depends: python-pexpect
	# pytest -v
}

package() {
	cd argcomplete
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE.rst
}
