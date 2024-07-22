# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=btrfs-progs
pkgver=6.9.2
pkgrel=1
pkgdesc='Btrfs filesystem utilities'
arch=('x86_64' 'aarch64' 'riscv64')
makedepends=('git' 'asciidoc' 'xmlto' 'python' 'python-setuptools' 'e2fsprogs' 'linux-headers')
depends=('util-linux-libs' 'zlib' 'zstd' 'libgcrypt' 'libudev' 'lzo')
optdepends=('python: libbtrfsutil python bindings'
            'e2fsprogs: btrfs-convert'
            'reiserfsprogs: btrfs-convert')
url='https://btrfs.readthedocs.io'
license=('GPL-2.0-only')
source=("https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v$pkgver.tar.xz")
options=(!staticlibs)
sha256sums=('43865bb272dc0ab2585de3605434d81ba217578f0897bf700cd36c14ac40652a')

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr --with-crypto=libgcrypt --disable-backtrace --disable-documentation
  make
}

check() {
  cd $pkgname-v$pkgver
 ./btrfs filesystem show
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install install_python

  # install bash completion (FS#44618)
  install -Dm644 btrfs-completion "$pkgdir/usr/share/bash-completion/completions/btrfs"
}
