# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-xdist
pkgver=3.7.0
pkgrel=1
pkgdesc='py.test xdist plugin for distributed testing and loop-on-failing modes'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-xdist'
depends=('python-execnet' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-filelock' 'python-psutil')
source=("git+https://github.com/pytest-dev/pytest-xdist.git#tag=v$pkgver")
sha512sums=('3fb413e7291ee137b19aa36fd4ae9eb34165a55da7c1235743487386edf0c877c39bbe8839b44d657698d52d9c1404eac0ae13baeca85c0505694a7653b8b665')

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
