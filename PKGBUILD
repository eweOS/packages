# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=btrfs-progs
pkgver=6.17.1
pkgrel=1
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
sha256sums=('a4be0a6ebb3c476427fb5d97b2cf027b0ccdb6b0c55ff16323320c1e8cb77658')

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
