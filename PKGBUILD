# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=arch-install-scripts
pkgver=28
pkgrel=2
pkgdesc="Scripts to aid in installing Arch Linux"
arch=('any')
url="https://github.com/archlinux/arch-install-scripts"
license=('GPL2')
makedepends=('git')
source=("git+https://github.com/archlinux/arch-install-scripts#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//'
}

prepare() {
  cd $pkgname
  # TODO: make all needs asciidoc
  sed -i 's/$(BINPROGS) man/$(BINPROGS)/' Makefile
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
  mkdir -p $pkgdir/usr/bin
  # TODO: make install needs asciidoc
  for binprog in arch-chroot genfstab pacstrap; do
    install -m 0755 $pkgname/$binprog $pkgdir/usr/bin
  done
}

