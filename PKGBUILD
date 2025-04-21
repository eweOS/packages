# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-referencing
_pyname=${pkgname#*-}
_referencingsuite_commit=b74fd4535fed598519d23c8cd74e5e8c77489440
pkgver=0.36.2
pkgrel=1
pkgdesc='An implementation-agnostic implementation of JSON reference resolution'
url='https://referencing.readthedocs.io/'
arch=(any)
license=(MIT)
depends=(python python-attrs python-rpds-py)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-hatchling python-hatch-vcs git)
checkdepends=(python-pytest python-pytest-subtests)
source=("https://github.com/python-jsonschema/referencing/archive/refs/tags/v$pkgver.tar.gz"
	"git+https://github.com/python-jsonschema/referencing-suite.git#commit=$_referencingsuite_commit")
sha256sums=('5618f8b72ecac48bbda2b927e6ec7589dfeddcceae01a8d8b64a7a92e4b4417e'
	    'SKIP')

build() {
	cd "$_pyname-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
		python -m build --wheel --no-isolation
}

check() {
	cd "$_pyname-$pkgver"
	REFERENCING_SUITE="$srcdir/referencing-suite" pytest -vv
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
