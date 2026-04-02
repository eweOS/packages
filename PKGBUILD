# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libaom
pkgver=3.13.2
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
sha256sums=('634039cc79c3a3307206b6c25ea759abc0e734c6f4ac14f6dbea5694e46af837'
            'ebebbb193c5971234980dec3facf97015c1b32750bb9f913710d2cee5f98765d'
            'd381256ef8b042b98d5da8c1b77775e6cabfbfc2b2a03d75e3e5bf9b37ba45d3')

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
