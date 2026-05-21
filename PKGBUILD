# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.6.3
pkgrel=2
pkgdesc='Python and tab completion, better together.'
url='https://kislyuk.github.io/argcomplete/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm git python-hatchling python-hatch-vcs)
checkdepends=(python-pexpect python-pip zsh)
source=("git+https://github.com/kislyuk/argcomplete.git#tag=v$pkgver")
sha256sums=('b935cec3031ebe4d5fb0475582b9c175330b21569dbc192ed051d54bd5c555c5')

build () {
	cd argcomplete
	python -m build --wheel --no-isolation
}

check() {
	cd argcomplete

	mkdir install
	python -m installer --destdir=install dist/*.whl

	PATH="$PWD/install/usr/bin:$PATH" ./test/test.py -v
}

package() {
	cd argcomplete
	python -m installer --destdir=$pkgdir dist/*.whl
	_install_license_ LICENSE.rst
}
