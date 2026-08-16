# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.7.2
pkgrel=1
pkgdesc='Python and tab completion, better together.'
url='https://kislyuk.github.io/argcomplete/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm git python-hatchling python-hatch-vcs)
checkdepends=(python-pexpect python-pip zsh)
source=("git+https://github.com/kislyuk/argcomplete.git#tag=v$pkgver")
sha256sums=('941450e81037cb0e4d3467e9810bdad7132c28218f34543082ef14c0d241e9a2')

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
