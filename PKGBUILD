# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libaom
pkgver=3.6.1
pkgrel=1
pkgdesc='Alliance for Open Media (AOM) AV1 codec SDK.'
url='https://aomedia.googlesource.com/aom/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(perl cmake nasm)
source=("https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz")
sha256sums=('42b862f58b3d00bd3902d2dc469526574f5b012e5b178e6a9652845a113d6887')

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
