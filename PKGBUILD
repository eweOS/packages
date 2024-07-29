# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=(util-linux util-linux-libs)
pkgver=2.40.2
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/karelzak/util-linux
license=(GPL)
makedepends=('bison' 'gettext' 'libtool' 'sqlite' 'linux-headers')
source=("util-linux-${pkgver}.tar.gz::https://github.com/karelzak/util-linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e5f5de12d1b02d44e2511e5f2c6c36236a5331b1cd915c2f7e8868bac677ace')

_command_needed=(
  'addpart' 'agetty' 'cfdisk' 'chcpu' 'chmem' 'choom' 'col' 'colcrt' 'colrm' 'column'
  'ctrlaltdel' 'delpart' 'eject' 'fdisk' 'fincore' 'findfs' 'findmnt' 'fsck.cramfs'
  'hardlink' 'ipcmk' 'ipcrm' 'ipcs' 'irqtop' 'isosize' 'ldattach' 'look' 'lsblk' 'lscpu' 'lsipc'
  'lsirq' 'lslocks' 'lslogins' 'lsmem' 'lsns' 'mcookie' 'mkfs' 'mkfs.bfs' 'mkfs.cramfs'
  'mkfs.minix' 'namei' 'nologin' 'nsenter' 'partx' 'prlimit' 'raw' 'rename' 'resizepart'
  'scriptlive' 'setterm' 'sfdisk' 'sulogin' 'uclampset' 'ul' 'uuidgen' 'uuidd' 'uuidparse'
  'wdctl' 'whereis' 'wipefs' 'zramctl'
)

prepare() {
  _patch_ "${pkgbase}-${pkgver}"
}

build() {
  cd "${pkgbase}-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-usrdir-path \
    --enable-fs-paths-default=/usr/bin:/usr/local/bin
  make
}

package_util-linux() {
  depends=('util-linux-libs')
  cd "${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" usrsbin_execdir=/usr/bin install
  for dir in "${pkgdir}/usr/bin" "${pkgdir}/usr/share/bash-completion/completions"; do
    cd $dir
    for file in $dir/*; do
      if [[ ! " ${_command_needed[*]} " =~ " ${file##*/} " ]]; then
        rm -r $file
        echo "removed $file"
      fi
    done
  done
  rm "${pkgdir}"/usr/lib/lib*.{a,so}*
  mv "${pkgdir}"/usr/include "${srcdir}"/include
}

package_util-linux-libs() {
  provides=('libutil-linux' lib{blkid,fdisk,lastlog2,mount,smartcols,uuid}.so)
  make -C "${pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install-usrlib_execLTLIBRARIES
  mv "${srcdir}"/include "${pkgdir}"/usr/include
}
