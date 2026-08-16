# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdvdread
pkgver=7.1.1
pkgrel=1
pkgdesc='Library for reading DVD video disks'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.videolan.org/developers/libdvdnav.html'
license=(GPL-2.0-or-later)
makedepends=(git meson)
# TODO: Package libdvdcss for eweOS
# optdepends=('libdvdcss: Decoding encrypted DVDs')
# 0001: Downstream, avoid generating changelog dynamically during building with
#	git log, which affects reproducibility and may also fail if the parent
#	directory has a different permission.
source=("git+https://code.videolan.org/videolan/libdvdread.git#tag=$pkgver"
	"0001-meson.build-avoid-generation-of-changelog-from-git.patch")
sha256sums=('7cac1f52598575421202ae645bacf8ce46fb389f1380a19d381c9235700f9465'
            '227de7f6145f45736b463fa0c973ca096c55e0b7ee6a539e7e69255eda8db345')

prepare() {
  _patch_ $pkgname
}

build() {
  ewe-meson $pkgname build \
    -Dlibdvdcss=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
