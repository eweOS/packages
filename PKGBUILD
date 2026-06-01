# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=btrfs-progs
pkgver=7.0
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
sha256sums=('c286d6876cbcd72327a0b417e4cfd280353ec23e37b549fdbcd7800a832d9a99')

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
