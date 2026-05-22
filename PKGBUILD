# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=bzip2
pkgname=libbz2
pkgver=1.1.0
pkgrel=6
pkgdesc="A high-quality data compression program"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD')
url="https://sourceware.org/bzip2/"
depends=('musl' 'sh')
makedepends=(meson git)
provides=(bzip2 'libbz2.so')
_commit=66c46b8c9436613fd81bc5d03f63a61933a4dcc3
source=(git+https://gitlab.com/bzip2/${_pkgbase}.git#commit=$_commit)
sha256sums=('72905925e874c1efe338eebf84fa11c541f4a5781265fbc33558ec22100b4885')

prepare()
{
  # disable tests since no pytest
  sed -i '$ d' ${_pkgbase}/meson.build
}

build()
{
  ewe-meson ${_pkgbase} build -D docs=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir="$pkgdir"
  # binaries are already provided by busybox
  rm -rf "$pkgdir/usr/share"
  rm -rf "$pkgdir/usr/bin"
}
