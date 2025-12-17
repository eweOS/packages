# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pahole
pkgname=(pahole)
pkgver=1.31
pkgrel=2
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
# 0002: Under review, correctly parse DW_AT_location entries with uconst
#	operations. Necessary to for RISC-V kernels compiled with LLVM 20 or
#	later to ship correct BTF debuginfo.
#
#	https://lore.kernel.org/dwarves/20251213082721.51017-2-me@ziyao.cc/
#
#	For analysis of RISC-V kernel module loading failures,
#	https://github.com/ClangBuiltLinux/linux/issues/2089
source=("git+https://github.com/acmel/dwarves#tag=v$pkgver"
	0001-CMakeLists.txt-Install-ostra.py-into-Python3_SITELIB.patch
	0002-dwarf_loader-Handle-DW_AT_location-attrs.patch)
sha256sums=('5737aa7a32f9427514c9dbcde428da36f3fd0c9425360a6c4dc1c830b31f7806'
            '78e169010fd516a8902d9f1c8e76603aea6d9c3f02947949fcbc92c963a2860b'
            '5373a46f4111d10dc84e1340e7337ccc968fa1e57832a5d50092f536857e1932')

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
