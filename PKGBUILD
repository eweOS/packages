# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=poetry-core
pkgname=python-${_pkgname}
pkgver=1.9.1
pkgrel=1
pkgdesc='Poetry PEP 517 Build Backend & Core Utilities'
arch=(any)
url="https://github.com/python-poetry/${_pkgname}"
license=(MIT)
groups=(python-build-backend)
_pydeps=(fastjsonschema
         lark-parser
         packaging)
depends=(
  python
  python-fastjsonschema
  python-lark-parser
  python-packaging
)
makedepends=(python-build python-installer)
#FIXME: missing check depends
#checkdepends=(git
#              python-pytest
#              python-pytest-mock
#              python-setuptools
#              python-tomli-w
#              python-virtualenv)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$pkgname-1.9.0-devendor.patch")
sha256sums=('ca398d26f666e09162847ddd7f8d6ff6b9fb07003c6d43dd68e80d0a78331aa7'
            'b6136544236192c80f3c34f266023fb285b753321679c29e61b69b26913c66d2')

prepare() {
	_patch_ "$_archive"
	rm -rv "$_archive/src/poetry/core/_vendor"
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	#FIXME: missing check depends
	# only works inside git repositories
	#pytest \
	#	-k 'not test_default_with_excluded_data and not test_default_src_with_excluded_data'
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
