# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pahole
pkgname=(pahole)
pkgver=1.32
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
# 0001: Should be upstreamed, install ostra.py module to Python site-packages,
#	instead of /usr/share/dwarves/runtime/python.
#	See also https://bugs.archlinux.org/task/70013
source=("git+https://github.com/acmel/dwarves#tag=v$pkgver"
	0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch)
sha256sums=('928f57019cd5ee6e0095531525cbad561f9e05ea057933c2739e4d0dfe2485bd'
            '78e169010fd516a8902d9f1c8e76603aea6d9c3f02947949fcbc92c963a2860b')

prepare() {
  _patch_ dwarves
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
