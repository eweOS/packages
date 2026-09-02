# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libaom
pkgver=3.15.0
pkgrel=1
pkgdesc='Alliance for Open Media (AOM) AV1 codec SDK.'
url='https://aomedia.googlesource.com/aom/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
provides=(aom)
makedepends=(perl cmake nasm)
# 0001: Should be upstreamed, define _POSIX_C_SOURCE to get declaration of
#	ftello, to fix compatibility with musl systems.
# 0002: Downstream, don't install static libraries or include static library
#	targets in CMake config files.
#	Since pacman will strip static library away, if we keep static library
#	targets, consumer of libaom built with CMake may fail to import
#	corresponding static targets.
source=(
	"https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz"
	0001-define-_POSIX_C_SOURCE-for-ftello.patch
	0002-Don-t-install-static-libraries.patch
)
sha256sums=('ea08c38ecc078bc85bb1b691020e52b06250f1a81fe7ca5b624629225081af96'
            'f9e6c6fb9dd0d3dec906c6677b220ace1804a7661ff315ffc78b7d1629a3c84f'
            '8fbf16f3bd4307e9624c2f639a66eac5aa6b2ea07bb7badc50f56bd148e74dec')

prepare() {
  _patch_ libaom-$pkgver
}

build() {
  local _assembler

  case "$CARCH" in
  x86_64)
    _assembler="nasm" ;;
  *)
    _assembler="llvm-as" ;;
  esac

  cmake -S libaom-$pkgver -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_TUNE_VMAF=0 \
    -DCMAKE_ASM_COMPILER="$_assembler" \
    libaom-$pkgver
  cmake --build build
}

package()
{
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ libaom-$pkgver/LICENSE
}
