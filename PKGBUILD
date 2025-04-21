# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-pdm-backend
_pyname=${pkgname#*-}
pkgver=2.4.4
pkgrel=1
pkgdesc='Build backend used by PDM that supports latest packaging standard'
url='https://backend.pdm-project.org/'
arch=(any)
license=(MIT)
depends=(python python-packaging python-editables python-tomli-w
	 python-pyproject-metadata)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest git mercurial python-setuptools)
# 0001: Downstream, devendor dependencies
#	source: https://gitlab.archlinux.org/archlinux/packaging/packages/python-pdm-backend/-/blob/f7c9b3501912f01b2e220d2bd6ebd53804b33de5/python-pdm-backend-2.4.3-devendor.patch
#	Cannot figure out why upstream vendors the dependencies.
source=("https://github.com/pdm-project/pdm-backend/archive/refs/tags/$pkgver.tar.gz"
	"0001-python-pdm-backend-2.4.3-devendor.patch")
sha256sums=('d77661cd03121a89e323db364863793bf170a93dcb0d7abb328772c386527f93'
            '2bc1924abc74c66ea3056ddefdcf7a7e9b76c4ca9f87a0bbddc1a5da73a99eaa')

prepare() {
	_patch_ "$_pyname-$pkgver"
}

build() {
	cd "$_pyname-$pkgver"
	PDM_BUILD_SCM_VERSION="$pkgver" \
		python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"

	# Switch to a fake HOME to prevent existing git configuration messes
	# the testsuite up.
	(
		export HOME="$srcdir/fakehome"
		mkdir -p "$HOME"
		git config --global user.name "testuser"
		git config --global user.email "testuser@example.com"
		PYTHONPATH="$PWD/src" pytest -v
	)
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
