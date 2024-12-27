# Maintainer: Yukari Chiba <i@0x7f.cc>

_pyname=pytest-subtests
pkgname=python-$_pyname
pkgver=0.14.1
pkgrel=1
pkgdesc='unittest subTest() support and subtests fixture'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-subtests'
depends=('python-attrs' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest-xdist')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('84962d65c4816620e4554e6f61a0723a77fc6b6eeda7b3ab458c145b35fd21f89de34d308a512244a1d71e6380708d0fb1032a1353550847783195b3c4b1f862')

build() {
  cd $_pyname
  python -m build -nw
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_pyname
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages" pytest
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
