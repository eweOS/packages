# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=base
pkgname=(base base-baremetal)
pkgver=1
pkgrel=3
arch=('any')
license=('GPL')

package_base() {
  pkgdesc='Minimal package set to define a basic eweOS installation'
  depends=(
    'filesystem' 'musl' 'bash' 'llvm-libs'
    'busybox' 'file'
    'util-linux' 'ca-certs'
    'gettext-tiny' 'xz'
    'pacman'
  )
  optdepends=('base-baremetal: bare metal support')
}

package_base-baremetal() {
  pkgdesc='Minimal package set to define a baremetal eweOS installation'
  depends=(
    'base' 'pciutils' 'dinit' 'dinit-services'
    'limine' 'tinyramfs'
  )
  optdepends=(
    'linux: linux kernel (stable)'
    'linux-lts: linux kernel (lts)'
    'linux-firmware: firmware binary blobs'
  )
}
