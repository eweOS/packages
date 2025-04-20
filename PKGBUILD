# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fuse
pkgname=(fuse-common fuse3)
pkgver=3.17.1
pkgrel=1
pkgdesc='Interface for userspace programs to export a filesystem to the Linux kernel'
url='https://github.com/libfuse/libfuse'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
makedepends=('pkgconf' 'meson' 'git' 'linux-headers')
options=('!emptydirs')
source=("$pkgbase::git+$url#tag=fuse-$pkgver")
sha256sums=('9ab433d7a49ebab83ce07e996525ead454640bd46f799cbcd5b27b1cf24d997b')

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
