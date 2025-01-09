# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-argcomplete
pkgver=3.5.3
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
sha256sums=('4d3614b7535a1373f9f4d4d16da8958cc2dcd1d483ff4e382e2825e1fc10788c')

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
