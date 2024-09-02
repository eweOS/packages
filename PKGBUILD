# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=bzip2
pkgname=libbz2
pkgver=1.1.0
pkgrel=3
pkgdesc="A high-quality data compression program"
arch=(x86_64 aarch64 riscv64)
license=('BSD')
url="https://sourceware.org/bzip2/"
depends=('musl' 'sh')
makedepends=(meson)
provides=(bzip2 'libbz2.so')
_commit=2d8393924b9f3e014000c7420c7da7c3ddb74e2c
source=(https://gitlab.com/bzip2/${_pkgbase}/-/archive/${_commit}/bzip2-${_commit}.tar.gz)
sha256sums=('19f03adba109479ed2dcd381890ae9b10a592adaa36d86218531800e1ad68c98')

prepare()
{
  # disable tests since no pytest
  sed -i '$ d' ${_pkgbase}-${_commit}/meson.build
}

build()
{
  ewe-meson ${_pkgbase}-${_commit} build -D docs=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir="$pkgdir"
  # binaries are already provided by busybox
  rm -rf "$pkgdir/usr/share"
  rm -rf "$pkgdir/usr/bin"
}
