# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.5.2
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
sha256sums=('ac05ce8ffb782ce3331738e1760ac5c66801babdd5361cb57e78a9c356d5d08b')

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
