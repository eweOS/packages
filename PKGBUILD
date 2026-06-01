# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-contrib
pkgver=1.13.1
pkgrel=1
pkgdesc='Contributed scripts and tools for pacman systems'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.archlinux.org/pacman/pacman-contrib"
license=('GPL-2.0-or-later')
depends=('pacman' 'libalpm')
makedepends=('git' 'asciidoc')
optdepends=(
  'diffutils: for pacdiff'
  'fakeroot: for checkupdates'
  'mlocate: for pacdiff --locate'
  'perl: for pacsearch'
  'sudo: privilege elevation for several scripts'
  'vim: default merge program for pacdiff'
)
source=(
  "git+$url.git#tag=v$pkgver"
  eweos-archs.patch
)
sha256sums=('2be546b3d6e3e1b57150d63e81d69d169af791f5f23f7d3ebbe5de231b4cc839'
            '75895a1b80ae064068edfc32e3aa8bab9d41f958afe27f2990d4c1bd50b68c37')

prepare() {
  _patch_ "$pkgname"
  cd "$pkgname"
  ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/lib/systemd
}
