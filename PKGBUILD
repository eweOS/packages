# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libaom
pkgver=3.7.0
pkgrel=1
pkgdesc='Alliance for Open Media (AOM) AV1 codec SDK.'
url='https://aomedia.googlesource.com/aom/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(perl cmake nasm)
source=(
	"https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz"
	"libaom-3.4.0-posix-c-source-ftello.patch"
)
sha256sums=('d1773bb6f050b430af47741306ac37a6aa2fec7364cb0dc27e3b1454a138934f'
            'ebebbb193c5971234980dec3facf97015c1b32750bb9f913710d2cee5f98765d')

prepare()
{
  cd libaom-$pkgver
  patch -p1 < ../libaom-3.4.0-posix-c-source-ftello.patch
}

build()
{
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_TUNE_VMAF=0 \
    libaom-$pkgver
  make
}

package()
{
  make install DESTDIR=$pkgdir
  install -Dm 644 libaom-$pkgver/LICENSE \
    $pkgdir/usr/share/licenses/libaom/LICENSE
}
