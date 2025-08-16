# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pacman-contrib
pkgver=1.10.6
pkgrel=6
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
sha256sums=('73d360e3d08c73cc2c1a75e7cec6b8101bb359ad7c991388c410d75dee704fd2'
            '5c5ccd1d8d2a3e75cb314167abd0bf830e2ca35f23dd9e282281732c3b695fcf')

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
