# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-wrapt
pkgver=2.1.2
pkgrel=2
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/GrahamDumpleton/wrapt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('91fcf4bd1af0ab1175cc8bc31acf5a3aaaa0fa4893e65273b31c8953ebfe2929fe7ec9927b61403230ab21c4029e9c4f1396d13fc649de40dcb9729eee672070')

prepare() {
  # Remove tests that require mypy to run
  rm wrapt-$pkgver/tests/mypy/*
}

build() {
  cd wrapt-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd wrapt-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" py.test
}

package() {
  cd wrapt-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
