# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=f2fs-tools
pkgver=1.16.0
pkgrel=1
pkgdesc='Userland tools for the f2fs filesystem'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/about
license=('GPL-2.0-only AND (GPL-2.0-only OR LGPL-2.1-only)')
depends=(lz4 musl util-linux-libs)
makedepends=(bsd-compat-headers linux-uapi-headers)
provides=(libf2fs.so libf2fs_format.so)
# These patches are backports from upstream.
# 0001: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=b15b6cc56ac7764be17acbdbf96448f388992adc
# 0002: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=ab4df39dcddf84429060d47f63570ca5704104d4
source=(
  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/$pkgname-$pkgver.tar.gz
  0001-convert-to-lseek-and-kill-lseek64.patch
  0002-link-using-libf2fs.la.patch
)
sha256sums=(
  208c7a07e95383fbd7b466b5681590789dcb41f41bf197369c41a95383b57c5e
  86c0310de6e287c64077c89339d2c5a9fe630011bfb73b2f984a583af891d0ec
  d8dcfee3e2ce55ec3d3f7ef4ac9b0a253525cef2df51d2e8f049749ca35418c8
)

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix /usr --sbindir /usr/bin
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" SBINDIR=/usr/bin
}
