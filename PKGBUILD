# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gparted
pkgver=1.6.0
pkgrel=1
pkgdesc='A Partition Magic clone, frontend to GNU Parted'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://gparted.org/'
license=('GPL')
depends=('parted' 'gtkmm3')
makedepends=('intltool' 'itstool' 'pkgconf')
optdepends=('dosfstools: for FAT16 and FAT32 partitions'
            'jfsutils: for jfs partitions'
            'f2fs-tools: for Flash-Friendly File System'
            'btrfs-progs: for btrfs partitions'
            'exfatprogs: for exFAT partitions'
            'ntfs-3g: for ntfs partitions'
            'reiserfsprogs: for reiser partitions'
            'udftools: for UDF file system support'
            'xfsprogs: for xfs partitions'
            'nilfs-utils: for nilfs2 support'
            'polkit: to run gparted from application menu'
            'gpart: for recovering corrupt partition tables'
            'mtools: utilities to access MS-DOS disks')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9b9f51b3ce494ddcb59a55e1ae6679c09436604e331dbf5a536d60ded6c6ea5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib/gparted \
      --enable-online-resize
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
