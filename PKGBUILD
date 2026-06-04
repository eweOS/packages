# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libfm-qt
pkgver=2.4.0
pkgrel=2
pkgdesc="Core library of PCManFM-Qt (Qt binding for libfm)"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/libfm-qt/blob/2.0.1/README.md?plain=1#L8-L10
license=("LGPL-2.1-or-later")
depends=("menu-cache" "libexif" "qt6-base" "lxqt-menu-data")
makedepends=("lxqt-build-tools" "ninja" "qt6-base-devel" "git")
optdepends=(
  "org.freedesktop.secrets: allow to remember mount passwords"
)
provides=("libfm-qt6.so")
source=(
  "git+$url.git#tag=$pkgver"
  fix-build.patch
  no-x11.patch
)
sha512sums=('1084c0cb9cbcb7ca38e3c45b9c0a24cc6393e85546670d603abe6d1b17cfea0d0c395c0f916c65a84b15ad749f46b2353dc816d47c5c0827a8afbb508cf3ef2b'
            '3fa3cfdf8a4c3fb091584460a287b3f53a0245322f8056cdda1364498606c5cef3b5b8feffbf01cd29c54ce386636f3931622477c4bd26d5819b817e0086f21a'
            'e44810e88f2d33b6faa8aac25effee664aa51d89e66af1c081a793e04e4feb362a7a7c68d91cada1e376fa4a359529ebdcc642463683c187b749c86d9ca5f2cc')

# Work-around https://gitlab.kitware.com/cmake/cmake/-/issues/17122
# Relevant CMake codes: https://github.com/lxqt/libfm-qt/blob/1.2.1/src/CMakeLists.txt#L179
options=('!emptydirs')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  sed -i '/XCB/d' CMakeLists.txt
}

build() {
    cd $pkgname
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=True
	cmake --build build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build

  _cmake_file=$pkgdir/usr/share/cmake/fm-qt6/fm-qt6-targets.cmake
  # workaround for cmake file
  install -Dm0644 build/fm-qt6-targets.cmake $_cmake_file
  sed -i "s@$srcdir/libfm-qt/build/src/libfm-qt6.so@/usr/lib/libfm-qt6.so@" $_cmake_file
  sed -i "s@;$srcdir/libfm-qt/build/src/CMakeFiles/include@@" $_cmake_file
  sed -i "s@$srcdir/libfm-qt/src/;@/usr/include/libfm-qt6;@" $_cmake_file
}
