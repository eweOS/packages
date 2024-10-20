# Maintainer: Yukari Chiba <i@0x7f.cc>

_pyname=ufoLib2
pkgname=python-${_pyname,,}
pkgver=0.16.0
pkgrel=2
pkgdesc='A library to deal with UFO font sources'
arch=(any)
url="https://github.com/fonttools/$_pyname"
license=(Apache)
depends=(python
         python-attrs
         python-cattrs
         python-fonttools
         python-fs
         python-lxml)
makedepends=(git
	     python-build
             python-installer
             python-wheel
             python-setuptools-scm) # scm required for _version file generation
checkdepends=(python-msgpack
              python-pytest)
_archive="$_pyname"
source=("git+$url#tag=v$pkgver")
sha256sums=('bdd0254512e9934646da072011031da196e58dfbc88c05fa89e5680976cbe1ae')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests --deselect tests/serde/test_json
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
