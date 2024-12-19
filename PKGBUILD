# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freeglut
pkgver=3.6.0
pkgrel=1
pkgdesc="Free OpenGL Utility Toolkit"
url="https://freeglut.sourceforge.net/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(X11)
depends=(libgl wayland libxkbcommon)
makedepends=(
  cmake
  git
  glu
  linux-headers
  mesa
  ninja
  wayland-protocols
)
provides=(glut)
conflicts=(glut)
source=(
  "git+https://github.com/FreeGLUTProject/freeglut#tag=v$pkgver"
  gl-lib.patch
)
sha256sums=('f9d4c26713ffd2e1b2db8c75648909be563c38e9099de7bcd77846e4a2887270'
            '4c26b4123071571b29821ec198f2f4d05e6b81c66504cf7df053fb0cec506f1e')

prepare() {
  _patch_ freeglut
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_PREFIX=/usr
    -D FREEGLUT_BUILD_STATIC_LIBS=OFF
    -D FREEGLUT_WAYLAND=ON
  )

  cmake -S freeglut -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  ln -s glut.pc "$pkgdir/usr/lib/pkgconfig/freeglut.pc"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" freeglut/COPYING
}
