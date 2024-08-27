# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=btrfs-progs
pkgver=6.10.1
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
sha256sums=('25684696bc5b5d07c98f19d4bf7a48b53ab94870ca4c468a68af3df9e2c8a35e')

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
