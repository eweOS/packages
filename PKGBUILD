# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-ptyprocess
_pyname=${pkgname#*-}
pkgver=0.7.0
pkgrel=1
pkgdesc='Run a subprocess in a pseudo terminal'
url='https://ptyprocess.readthedocs.io/en/latest/'
arch=(any)
license=(ISC)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-flit-core)
checkdepends=(python-pytest)
source=("git+https://github.com/pexpect/ptyprocess.git#tag=$pkgver")
sha256sums=('db96aeacae892c53c745c7b8e670664d8d1ed71fcc9e9e533b61a5bd8668d675')

prepare() {
	# 4378f72 Run tests on macOS
	# 9f58dc2 Add support for Python 3.10 and 3.11
	# b5b17d6 Add support for Python 3.12
	# a443129 Remove unittest.makeSuite, gone from Python 3.13
	cd "$_pyname"

	git cherry-pick -n \
		4378f72cefcba74275504b563488e36bc09b3336	\
		9f58dc29fef2ac457f5f2c35719412aa26e4f121	\
		b5b17d64aa8eb83d3b329d50e05a9682d4061e72	\
		a44312974bd9084aa568d2e18ce5b2a7e0e45983
}

build() {
	cd "$_pyname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname"
	pytest -v
}

package() {
	cd "$_pyname"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
