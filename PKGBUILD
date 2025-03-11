# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-sniffio
_pyname=${pkgname#*-}
pkgver=1.3.1
pkgrel=1
pkgdesc='Glue for different async I/O implementations'
url='https://sniffio.readthedocs.io/'
arch=(any)
license=("Apache-2.0 OR MIT")
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-setuptools-scm)
# checkdepends=(python-pytest python-curio)
source=("https://github.com/python-trio/sniffio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eaaf93c6b263537535e4df0e070586e2ccae467153bb5eb7d588b8af98f24504')

build () {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

# Missing python-curio
# check() {
#	cd "$_pyname-$pkgver"
#	pytest -v
# }

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE.{APACHE2,MIT} \
		-t "$pkgdir"/usr/share/licenses/python-sniffio
}
