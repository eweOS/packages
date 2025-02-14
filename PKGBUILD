# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libaom
pkgver=3.12.0
pkgrel=1
pkgdesc='Alliance for Open Media (AOM) AV1 codec SDK.'
url='https://aomedia.googlesource.com/aom/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(musl)
provides=(aom)
makedepends=(perl cmake nasm)
source=(
	"https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz"
	"libaom-3.4.0-posix-c-source-ftello.patch"
)
sha256sums=('d89daa160a0ea1409c4193be5b17c9591024c4f5a0e545dcb9d197535c66836e'
            'ebebbb193c5971234980dec3facf97015c1b32750bb9f913710d2cee5f98765d')

prepare()
{
  _patch_ libaom-$pkgver
}

build()
{
  if [ $(uname -m) != x86_64 ]; then
	  asmdef="-DCMAKE_ASM_COMPILER=llvm-as"
  fi
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_TUNE_VMAF=0 \
    $asmdef \
    libaom-$pkgver
  make
}

package()
{
  make install DESTDIR=$pkgdir
  install -Dm 644 libaom-$pkgver/LICENSE \
    $pkgdir/usr/share/licenses/libaom/LICENSE
}
