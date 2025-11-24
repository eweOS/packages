# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-wrapt
pkgver=2.0.1
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/GrahamDumpleton/wrapt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ff7a69e7c2454f33f0f631f408013242a0292b28a8a601e981cef9b8c997b5769305bfb6b68b2504e96a1d2181d8e9aa48b25a159178f73906b53e527a00cbc5')

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
