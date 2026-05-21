# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fuse
pkgname=(fuse-common fuse3)
pkgver=3.18.2
pkgrel=2
pkgdesc='Interface for userspace programs to export a filesystem to the Linux kernel'
url='https://github.com/libfuse/libfuse'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
makedepends=('pkgconf' 'meson' 'git' 'linux-headers')
options=('!emptydirs')
source=("$pkgbase::git+$url#tag=fuse-$pkgver")
sha256sums=('8a75c33923d49a9529de0c496e9b93986e6ad220ce1f82eb434610e8202e138d')

build() {
  ewe-meson $pkgbase build -D examples=false
  meson compile -C build
}

package_fuse-common() {
  pkgdesc="Common files for fuse2/3 packages"
  backup=(etc/fuse.conf)
  install -Dm644 $pkgbase/util/fuse.conf "${pkgdir}"/etc/fuse.conf
}

package_fuse3() {
  depends=('fuse-common')

  meson install -C build --destdir "$pkgdir"
  rm -r "${pkgdir}"/etc/init.d
  rm -r "${pkgdir}"/etc/fuse.conf
  # static device nodes are handled by udev
  rm -r "${pkgdir}"/dev
}
