# Maintainer: Yukari Chiba <i@0x7f.cc>

_pyname=pytest-subtests
pkgname=python-$_pyname
pkgver=0.15.0
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
sha512sums=('36e639bd9957365188c090bd10cd2f291acb6c02e706251f0e3763dd381c32292ef76ba6995d3492ee110554e14a7f3c52085600e3a48952c41de80adc579735')

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
