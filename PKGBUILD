# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libaom
pkgver=3.13.1
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
	0001-define-_POSIX_C_SOURCE-for-ftello.patch
	0002-Don-t-install-static-libraries.patch
)
sha256sums=('19e45a5a7192d690565229983dad900e76b513a02306c12053fb9a262cbeca7d'
            'ebebbb193c5971234980dec3facf97015c1b32750bb9f913710d2cee5f98765d'
            'd381256ef8b042b98d5da8c1b77775e6cabfbfc2b2a03d75e3e5bf9b37ba45d3')

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
