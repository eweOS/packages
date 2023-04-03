# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=(util-linux util-linux-libs)
pkgver=2.38.1
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux'
arch=(x86_64 aarch64)
url=https://github.com/karelzak/util-linux
license=(GPL)
makedepends=(
  bison
  gettext
  libtool
)

_command_needed=('addpart' 'agetty' 'cfdisk' 'chcpu' 'chmem' 'choom' 'col' 'colcrt' 'colrm' 'column'
  'ctrlaltdel' 'delpart' 'eject' 'fincore' 'findfs' 'findmnt' 'fsck.cramfs'
  'hardlink' 'ipcmk' 'ipcrm' 'ipcs' 'irqtop' 'isosize' 'ldattach' 'look' 'lsblk' 'lscpu' 'lsipc'
  'lsirq' 'lslocks' 'lslogins' 'lsmem' 'lsns' 'mcookie' 'mkfs' 'mkfs.bfs' 'mkfs.cramfs'
  'mkfs.minix' 'namei' 'nologin' 'nsenter' 'partx' 'prlimit' 'raw' 'rename' 'resizepart'
  'scriptlive' 'setterm' 'sfdisk' 'sulogin' 'uclampset' 'ul' 'uuidgen' 'uuidd' 'uuidparse'
  'wdctl' 'whereis' 'wipefs' 'zramctl')

source=(
  "util-linux-${pkgver}.tar.gz::https://github.com/karelzak/util-linux/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('75add98ee04e8ca742e860dd06936379737465149904152175a64708de399125')

build()
{
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

package_util-linux()
{
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

package_util-linux-libs()
{
  provides=('libutil-linux')
  make -C "${pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install-usrlib_execLTLIBRARIES
  mv "${srcdir}"/include "${pkgdir}"/usr/include
}
