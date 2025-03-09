# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-attrs
pkgver=25.1.0
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
sha512sums=('27c52de58756e94e1e59c193a2ed107f3162b64254db92a4575926916306f6469cee9b5ee500f1f8a36310c3ab28a2b96e45a20784e4bd4edee838f6cd14b6b2')

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
