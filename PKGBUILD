# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cython
pkgver=3.3.0
pkgrel=1
pkgdesc='C-Extensions for Python'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://cython.org'
license=(Apache-2.0)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
source=(git+https://github.com/cython/cython#tag=$pkgver)
sha256sums=('89b5fcbb67c01e6c8fd079da74be1290c6f36ef10201dd7281eee8d6c17abe41')

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
