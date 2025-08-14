# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-wrapt
pkgver=1.17.3
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://pypi.python.org/pypi/wrapt"
license=("BSD-2-Clause")
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/GrahamDumpleton/wrapt/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1a1f7419f20faa461a9e23ad09cc98d381ef2c48b3b24ed1dfe98d42d16857a958252301e78dd41b7fa8ef37eea379f9244cace2b396b49718c44cbc701308a3')

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
