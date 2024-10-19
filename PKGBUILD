# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=btrfs-progs
pkgver=6.11
pkgrel=2
pkgdesc='Btrfs filesystem utilities'
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=('git' 'asciidoc' 'xmlto' 'python' 'python-setuptools' 'e2fsprogs' 'linux-headers')
depends=('util-linux-libs' 'zlib' 'zstd' 'libgcrypt' 'libudev' 'lzo')
optdepends=('python: libbtrfsutil python bindings'
            'e2fsprogs: btrfs-convert'
            'reiserfsprogs: btrfs-convert')
url='https://btrfs.readthedocs.io'
license=('GPL-2.0-only')
source=("https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v$pkgver.tar.xz")
options=(!staticlibs)
sha256sums=('ff9ae91521303a90d87e1c4be230f0121f39c44ddbe52c2aeae263c6fecfa099')

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
