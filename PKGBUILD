# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=arch-install-scripts
pkgver=28
pkgrel=3
pkgdesc="Scripts to aid in installing Arch Linux"
arch=('any')
url="https://github.com/archlinux/arch-install-scripts"
license=('GPL2')
makedepends=('git' 'asciidoc')
source=("git+https://github.com/archlinux/arch-install-scripts#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//'
}

prepare() {
  cd $pkgname
  # TODO: chroot does not accept "--"
  sed -i 's/-- "$chrootdir"/"$chrootdir"/' arch-chroot.in
}

build() {
  make -C $pkgname
}

check() {
  make -C "$pkgname" check
}

package() {
  make -C "$pkgname" PREFIX=/usr DESTDIR="$pkgdir" install
}

