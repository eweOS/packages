# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pahole
pkgname=(pahole)
pkgver=1.31
pkgrel=1
pkgdesc="Pahole and other DWARF utils"
url="https://git.kernel.org/pub/scm/devel/pahole/pahole.git"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
makedepends=(
  bash
  cmake
  git
  libelf
  linux-headers
  ninja
  zlib
)
source=("git+https://github.com/acmel/dwarves#tag=v$pkgver" 0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch)
sha256sums=('5737aa7a32f9427514c9dbcde428da36f3fd0c9425360a6c4dc1c830b31f7806'
            '78e169010fd516a8902d9f1c8e76603aea6d9c3f02947949fcbc92c963a2860b')

prepare() {
  cd dwarves

  # https://bugs.archlinux.org/task/70013
  git apply -3 ../0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch
}

build() {
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D __LIB=lib
  )

  cmake -S dwarves -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package_pahole() {
  depends=(
    bash
    libelf
    zlib
  )
  optdepends=('ostra-cg: Generate call graphs from encoded traces')
  provides=(libdwarves{,_emit,_reorganize}.so)

  DESTDIR="$pkgdir" cmake --install build

  cd $pkgdir
  # FIXME: needs matplotlib
  _pick_ ostra usr/{bin/ostra-cg,lib/python*}
}
