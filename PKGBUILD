# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-benchmark
pkgver=5.3.0
pkgrel=1
pkgdesc='A py.test fixture for benchmarking code'
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/ionelmc/pytest-benchmark'
depends=('python-pytest' 'python-py-cpuinfo')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
#checkdepends=('python-pygal' 'python-pygaljs' 'python-freezegun' 'mercurial' 'python-aspectlib'
#              'python-pytest-xdist' 'python-elasticsearch' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionelmc/pytest-benchmark/archive/v$pkgver.tar.gz")
sha512sums=('1720cee833b7dd1234afdbe621f0d1582b95e42c7bc0ee2a42217ee05117ea5735d82e6b383f42d72a18450c1cbaf4f0cc3444b59c0c0c9d21f87d9182527e98')

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
