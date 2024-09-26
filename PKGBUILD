# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-xdist
pkgver=3.6.1
pkgrel=1
pkgdesc='py.test xdist plugin for distributed testing and loop-on-failing modes'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-xdist'
depends=('python-execnet' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-filelock' 'python-psutil')
source=("git+https://github.com/pytest-dev/pytest-xdist.git#tag=v$pkgver")
sha512sums=('e36399a8c999b0d12fbdc97a6782ccaa3e5d1d4a685440018d3e951e9cb0325af5261391e8727a8c62f7bc0ac734030f7afda4040fd79b7c37a316799a9a9da5')

build() {
  cd pytest-xdist
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-xdist
  python -m installer -d "$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-xdist
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
