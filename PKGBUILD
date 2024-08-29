# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-attrs
pkgver=24.2.0
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
sha512sums=('3184a0f7f9877940663129aae3cc6e0eca8ffe14dd15d0d0e43b6651e8c5e3c8fab841432e06c3b22711b3d4579454e3ff47f60a957e5a6e3154caf138e8e6c1')

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
