# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-benchmark
pkgver=5.2.3
pkgrel=2
pkgdesc='A py.test fixture for benchmarking code'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/ionelmc/pytest-benchmark'
depends=('python-pytest' 'python-py-cpuinfo')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
#checkdepends=('python-pygal' 'python-pygaljs' 'python-freezegun' 'mercurial' 'python-aspectlib'
#              'python-pytest-xdist' 'python-elasticsearch' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionelmc/pytest-benchmark/archive/v$pkgver.tar.gz")
sha512sums=('65bb5413e1ef93672f9cca77ab1575b1299fa7a19ae6f44a4f5de3ca28f3ac1be9cec22cbde0ec8a498f3b8a1e20e78b6dec11f91efcb2804b812b77ce715df9')

prepare() {
  cd pytest-benchmark-$pkgver
}

build() {
  cd pytest-benchmark-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it
  # FIXME: missing dependencies
  cd pytest-benchmark-$pkgver
  #python setup.py install --root="$PWD/tmp_install" --optimize=1
  #local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" python -m pytest tests
}

package() {
  cd "$srcdir"/pytest-benchmark-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
