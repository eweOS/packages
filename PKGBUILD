# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=('flac' 'libflac')
pkgver=1.5.0
pkgrel=1
url='https://www.xiph.org/flac/'
depends=('musl')
source=("https://ftp.osuosl.org/pub/xiph/releases/flac/flac-${pkgver}.tar.xz")
sha256sums=('f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920')
arch=(x86_64 aarch64 riscv64 loongarch64)

prepare()
{
  cd flac-$pkgver
  # Build with root
  sed -i 's@test_level_1_())@true)@g' src/test_libFLAC/metadata_manip.c
  sed -i 's@test_level_1_())@true)@g' src/test_libFLAC++/metadata_manip.cpp
}

build()
{
  cd flac-${pkgver}
  ./configure --prefix=/usr
  make
  make install DESTDIR=${srcdir}/pkg
}

check()
{
  cd flac-${pkgver}
  make check
}

package_libflac()
{
  depends=('musl')
  provides=('libFLAC.so' 'libFLAC++.so')
  license=('BSD')
  fakepkg=${srcdir}/pkg
  mkdir -p ${pkgdir}/usr/share/
  mv ${fakepkg}/usr/share/aclocal ${pkgdir}/usr/share
  mv ${fakepkg}/usr/include ${fakepkg}/usr/lib ${pkgdir}/usr
  install -Dm 644 ${srcdir}/flac-${pkgver}/COPYING.Xiph ${pkgdir}/usr/share/licenses/libflac/COPYING
}

package_flac()
{
  depends=('musl' 'libflac')
  license=('BSD' 'GPL')
  fakepkg=${srcdir}/pkg
  mkdir -p ${pkgdir}/usr/share/
  mv ${fakepkg}/usr/share/man ${pkgdir}/usr/share
  mv ${fakepkg}/usr/bin ${pkgdir}/usr
  install -Dm 644 ${srcdir}/flac-${pkgver}/COPYING.Xiph ${pkgdir}/usr/share/licenses/flac/COPYING
}
