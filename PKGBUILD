# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-attrs
pkgver=24.2.0
pkgrel=2
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://www.attrs.org"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
# FIXME: missing dependencies
#checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("git+https://github.com/python-attrs/attrs.git#tag=$pkgver")
sha512sums=('96fdd1aa13c2136b11f86f88ce97c7c9ffce73974353b2a96207978694a3588b32ddec73a0ee76c164a0a48567845cbcb5097c1a7f1ddb8abfef9e553564b590')

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
