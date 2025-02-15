# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-numpy
pkgver=2.2.3
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
sha512sums=('78c876d8ecc13aa0f802460f6c1462b53162dfdf85c658e32f1cf9823eeef829b6f1af8285a6c0c75719f5a2e05ff8b987dab88a416df6a8371c16fd032f5e6a')

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
