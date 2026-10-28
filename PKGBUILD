# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fuse
pkgver=3.18.3
pkgrel=3
pkgdesc='Interface for userspace programs to export a filesystem to the Linux kernel'
url='https://github.com/libfuse/libfuse'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.1-only)
backup=(etc/fuse.conf)
provides=(fuse3)
makedepends=('pkgconf' 'meson' 'git' 'linux-headers')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=fuse-$pkgver")
sha256sums=('28ce65df85af891ff8288d7fc10259d0e07a01c734af24e80f98b2c155412560')

build() {
  ewe-meson $pkgname build -D examples=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "${pkgdir}"/etc/init.d
  # static device nodes are handled by udev
  rm -r "${pkgdir}"/dev
}
