# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gparted
pkgver=1.7.0
pkgrel=1
pkgdesc='A Partition Magic clone, frontend to GNU Parted'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('84ae3b9973e443a2175f07aa0dc2aceeadb1501e0f8953cec83b0ec3347b7d52')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp /usr/share/autoconf/build-aux/config.{guess,sub} .
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
