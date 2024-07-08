# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-contrib
pkgver=1.10.6
pkgrel=1
pkgdesc='Contributed scripts and tools for pacman systems'
arch=(x86_64 aarch64 riscv64)
url=https://gitlab.archlinux.org/pacman/pacman-contrib
license=('GPL-2.0-or-later')
depends=('pacman')
makedepends=('git')
optdepends=(
  'diffutils: for pacdiff'
  'fakeroot: for checkupdates'
  'findutils: for pacdiff --find'
  'mlocate: for pacdiff --locate'
  'perl: for pacsearch'
  'sudo: privilege elevation for several scripts'
  'vim: default merge program for pacdiff'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-doc
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -r $pkgdir/usr/lib/systemd
}
