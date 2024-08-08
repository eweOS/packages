# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cython
pkgver=3.0.11
pkgrel=1
pkgdesc='C-Extensions for Python'
arch=(x86_64 aarch64 riscv64)
url='https://cython.org'
license=(Apache-2.0)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/cython/cython#tag=$pkgver)
sha256sums=('8f6bc386d85aaf9bbab8174bc3f8c771204b0bedacd6e7502261a5fdcc4d9c75')

build() {
  cd cython
  python -m build --wheel --no-isolation
}

package() {
  cd cython
  python -m installer --destdir="$pkgdir" dist/*.whl

  for f in cygdb cython cythonize; do
    mv "$pkgdir"/usr/bin/$f "$pkgdir"/usr/bin/${f}3
    ln -s ${f}3 "$pkgdir"/usr/bin/$f
  done
}
