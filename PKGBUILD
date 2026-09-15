# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=pybind11
pkgver=3.1.0
pkgrel=1
pkgdesc='A lightweight header-only library that exposes C++ types in Python and vice versa'
arch=(any)
url=https://pybind11.readthedocs.io
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-scikit-build-core)
checkdepends=(boost catch2 eigen python-numpy python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/pybind/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(ef712655692a2e9bf7bb7874c022564a45f91d847ddee987e720cd9e28849665)

build() {
  cd $pkgname-$pkgver
  python -m build -wn
}

check() {
  local cmake_vars=(
    CMAKE_BUILD_TYPE=None
    PYBIND11_INSTALL=OFF
    PYBIND11_PYTEST_ARGS=--deselect=test_exceptions.py::test_cross_module_exception_translator
  )
  cmake -S $pkgname-$pkgver -B build ${cmake_vars[@]/#/-D}
  make -C build check
}

package() {
  cd $pkgname-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl

  cd "$pkgdir"
  install -d usr/include usr/share/{cmake,licenses,pkgconfig}
  local sitepkgs=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  ln -s $sitepkgs/$pkgname-$pkgver.dist-info/licenses/LICENSE usr/share/licenses/$pkgname
  ln -s $sitepkgs/$pkgname/include/$pkgname usr/include
  ln -s $sitepkgs/$pkgname/share/cmake/$pkgname usr/share/cmake
  ln -s $sitepkgs/$pkgname/share/pkgconfig/$pkgname.pc usr/share/pkgconfig
}
