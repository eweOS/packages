# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pexpect
_pyname=${pkgname#*-}
pkgver=4.9
pkgrel=1
pkgdesc='A Python module for controlling interactive programs in a pseudo-terminal'
url='http://pexpect.readthedocs.io/'
arch=(any)
license=(ISC)
depends=(python python-ptyprocess)
makedepends=(python-build python-installer python-setuptools python-wheel)
# TODO: enable testsuite, which somehow depends on the behaviour of coreutils
# checkdepends=(python-pytest zsh)
source=("https://github.com/pexpect/pexpect/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('13756b834dba0adf7603be77d943cc427011983ecd7c58b59b9bf122a1063e40')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
