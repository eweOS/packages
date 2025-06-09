# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-benchmark
pkgver=5.1.0
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
sha512sums=('92f3d99d92f52de9f1099b4b29f0fdbb246a0a4f9a95f6a7fe56b555a64482c718629d55f35e4ff1a18c6d453e6598d59c987eb0db6ff41a29d084166c134831')

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
