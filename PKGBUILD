# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=libjpeg-turbo
pkgbase=libjpeg
pkgname=libjpeg
pkgver=3.2.0
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline compression and decompression"
url="https://libjpeg-turbo.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(
  BSD-3-Clause
  IJG
)
provides=(
  libjpeg
  libjpeg.so
  libturbojpeg.so
  libjpeg-turbo
)
makedepends=(cmake ninja nasm)
# 0001: Backport, commit 2e87acde1ebe ("Build: Fix Un*x build if PIC disabled")
#	Fixes shared library linking with LTO enabled
source=(https://github.com/libjpeg-turbo/${_pkgbase}/releases/download/$pkgver/${_pkgbase}-$pkgver.tar.gz
	0001-Build-Fix-Un-x-build-if-PIC-disabled.patch)
sha256sums=('6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e'
            '6c42310c19f466ba9b46b0c0e57cc78581903a0ffedd148f16aee5873a36f8c2')

prepare() {
	_patch_ ${_pkgbase}-$pkgver
}

build() {
  cmake -S ${_pkgbase}-$pkgver -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_STATIC=OFF \
        -DWITH_JPEG8=ON \
        -W no-dev \
        -B build \
        -S ${_pkgbase}-$pkgver
  cmake --build build -v
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j"$JOBS"
}

package() {
  DESTDIR="$pkgdir" cmake --install build -v

  # header required by some dependents
  # https://bugs.archlinux.org/task/24787
  install -vDm 644 ${_pkgbase}-$pkgver/src/jpegint.h "$pkgdir/usr/include"

  install -vDm 644 ${_pkgbase}-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 ${_pkgbase}-$pkgver/README.ijg -t "$pkgdir/usr/share/licenses/$pkgname/"
}
