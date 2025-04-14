# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-attrs
pkgver=25.3.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://www.attrs.org"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
# FIXME: missing dependencies
#checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("git+https://github.com/python-attrs/attrs.git#tag=$pkgver")
sha512sums=('296e9262a12ccd10db8c7a540761ab387c9c884570a17d634906447feea6677fdd4e7d43d9d990487e66beeca245310e6e594e876cd6f45f687f106a0358d232')

build() {
  cd attrs
  python -m build -nw
}

check() {
  cd attrs
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  # FIXME: test errors and missing dependencies
  #PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" pytest
}

package() {
  cd attrs
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
