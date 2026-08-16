# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-attrs
pkgver=26.1.0
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
sha512sums=('6748df23bb17a72d2ce48034d80c718ce707e13504dc7e7cb4c820170e37ce47b21fc71efb0ff742eae2cac6b383d1909c456b899b1f4a213e5a44b0f4104121')

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
