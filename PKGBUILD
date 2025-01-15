# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-wrapt
pkgver=1.17.2
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/GrahamDumpleton/wrapt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('12a6e610f180ce34a7edad39225b54f62d58d487e8b3379321e00e0d0c1b265a5a570de15ec5e5a6b38748052617dbb486f802ae924ab48b51b3ccd40d1170bf')

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
