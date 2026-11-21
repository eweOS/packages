# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-jsonschema
_pyname=${pkgname#*-}
pkgver=4.26.0
pkgrel=1
pkgdesc='An implementation of the JSON Schema specification for Python'
url='https://python-jsonschema.readthedocs.io/en/stable/'
arch=(any)
license=(MIT)
depends=(python python-attrs python-jsonschema-specifications python-referencing)
optdepends=('python-fqdn: For hostname format'
	    'python-idna: For idn-hostname format'
	    'python-isoduration: For duration format'
	    'python-jsonpointer: For JSON-pointer and relative-JSON-pointer format'
	    'python-rfc3339-validator: For date-time format'
	    'python-rfc3987: For IRI, IRI-reference, URI and URI-reference format'
	    'python-uri-template: For URI-template format'
	    'python-webcolors: For color format')
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-hatchling python-hatch-fancy-pypi-readme python-hatch-vcs)
# Missing python-twisted
# checkdepends=(python-fqdn python-idna python-isoduration python-jsonpointer
#		python-pip python-rfc3339-validator python-rfc3987
#		python-twisted python-uri-template python-webcolors)
source=("https://github.com/python-jsonschema/jsonschema/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f937f75e2d22fb9b74e22dca25ea3d88c328393567af99e3c898fdca5a0e253')

build() {
	cd "$_pyname-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
		python -m build --wheel --no-isolation
}

# check() {
#	cd "$_pyname-$pkgver"
#	pytest -v
# }

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ COPYING
}
