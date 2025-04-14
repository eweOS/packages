# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.6.2
pkgrel=1
pkgdesc='Python and tab completion, better together.'
url='https://kislyuk.github.io/argcomplete/'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-wheel python-installer python-setuptools
	     python-setuptools-scm git python-hatchling python-hatch-vcs)
checkdepends=(python-pexpect zsh)
source=("git+https://github.com/kislyuk/argcomplete.git#tag=v$pkgver")
sha256sums=('a4fe80b7c9367120421b7cc1479703a8c55eb383f74c9ce9fe8274e8eb1dc710')

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
