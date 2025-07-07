# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-numpy
pkgver=2.3.1
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('blas-openblas: faster linear algebra')
makedepends=('python-build' 'python-installer' 'meson-python' 'cmake' 'flang' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('aedb917cc6d8fcb923edb5b32e8b84bddb31fcf0159cfbda88b7ea9a5bc9e0ef58f27391746c6e9140777daf928c3e9de2a73758555130e5c00725d7082f7c2a')

prepare() {
  cd numpy-$pkgver
  # skip this test, or it will stuck here
  sed -i 's/threading.active_count() > 1/threading.active_count() > 0/g' numpy/linalg/tests/test_linalg.py
}

build() {
  cd numpy-$pkgver
  CFLAGS+=" -ffat-lto-objects" \
  CXXFLAGS+=" -ffat-lto-objects" \
  python -m build --wheel --no-isolation \
    -Csetup-args="-Dblas=cblas" \
    -Csetup-args="-Dlapack=lapack"
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd numpy-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" python -c 'import numpy; numpy.test(verbose=2)'
}

package() {
  cd numpy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/numpy-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
