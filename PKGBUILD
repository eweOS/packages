# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=orc
pkgver=0.4.42
pkgrel=3
pkgdesc="Optimized Inner Loop Runtime Compiler"
url="https://gstreamer.freedesktop.org/modules/orc.html"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(
  musl
)
makedepends=(
  git
  linux-uapi-headers
  meson
)
# valgrind not available on riscv64 and loongarch64
makedepends_x86_64=(valgrind)
makedepends_aarch64=(valgrind)
# 0001: Under review, fix segmentation faults on startup of orcc on RISC-V
#	platforms where no core declares any mutli-character ISA extensions,
#	for example, VisionFive 2 in our build farm.
#	https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/279
source=("git+https://gitlab.freedesktop.org/gstreamer/orc.git#tag=$pkgver"
	0001-riscv-Fix-detection-when-cpuinfo-contains-no-multi-c.patch)
sha256sums=('a9e88b7f844897812e47ec5aa45698aa4cdd0ab0f38915e28f825a4a00f46434'
            'bfeb664ad9f3a789b58755ce0a4fae23956938d9377900925fcdd23e01b87ba5')

prepare() {
  _patch_ orc
}

build() {
  # FIXME: Testcases fail with -Os and above when compiled with Clang 20.
  #	   Remove this work around after upgrading Clang/LLVM.
  [ "$CARCH" = "loongarch64" ] && export CFLAGS="-O1"

  ewe-meson orc build -Dhotdoc=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  provides=(liborc{,-test}-${pkgver%.*}.so)

  meson install -C build --destdir "$pkgdir"
  _install_license_ orc/COPYING
}
