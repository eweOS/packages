# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lensfun
pkgver=0.3.4
pkgrel=1
pkgdesc='Database of photographic lenses and a library that allows advanced access to the database'
arch=(x86_64 aarch64 riscv64)
url='https://lensfun.github.io/'
license=(LGPL3)
depends=(glib2)
makedepends=(python-setuptools python-build python-installer python-wheel libpng cmake)
optdepends=('python: for lensfun-update-data and lensfun-add-adapter')
source=(https://github.com/lensfun/lensfun/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        fix-python-module-install.patch)
sha256sums=('dafb39c08ef24a0e2abd00d05d7341b1bf1f0c38bfcd5a4c69cf5f0ecb6db112'
            'aa45a8505dc7b4335130e9e6d3f516fd7aeee093f1d9af8ea8e6abc1057ba04c')

prepare() {
# Fix Python module installation
  patch -d $pkgname-$pkgver -p1 < fix-python-module-install.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -fno-delete-null-pointer-checks" \
    -DINSTALL_PYTHON_MODULE=OFF
  cmake --build build
  cd build/apps
  python -m build --wheel --no-isolation
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd build/apps
  python -m installer --destdir="$pkgdir" dist/*.whl
}
