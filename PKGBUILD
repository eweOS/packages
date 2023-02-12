# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=e2fsprogs
pkgver=1.47.0
pkgrel=1
pkgdesc='Ext2/3/4 filesystem utilities'
arch=('x86_64' 'aarch64')
license=('GPL' 'LGPL' 'MIT')
url='http://e2fsprogs.sourceforge.net'
depends=('util-linux-libs')
makedepends=('util-linux')
optdepends=('lvm2: for e2scrub'
  'util-linux: for e2scrub'
  'smtp-forwarder: for e2scrub_fail script')
provides=('libcom_err.so'
  'libe2p.so'
  'libext2fs.so'
  'libss.so')
source=("https://www.kernel.org/pub/linux/kernel/people/tytso/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build()
{
  cd "${pkgname}-${pkgver}"

  ac_cv_c_compiler_gnu=no \
    ac_cv_lib_dl_dlopen=no \
    ac_cv_path_mkdir=/bin/mkdir \
    ./configure \
    --prefix=/usr \
    --with-root-prefix='' \
    --enable-elf-shlibs \
    --enable-symlink-install \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-uuidd \
    --disable-libuuid \
    --disable-libblkid
  make

  # regenerate locale files
  find po/ -name '*.gmo' -delete
  make -C po update-gmo
}

check()
{
  cd "${pkgname}-${pkgver}"
  #make check
}

package()
{
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install install-libs

  sed -i -e 's/^AWK=.*/AWK=awk/' "${pkgdir}/usr/bin/compile_et"

  # remove references to build directory
  sed -i -e 's#^DIR=.*#DIR="/usr/share/ss"#' "${pkgdir}/usr/bin/mk_cmds"
  sed -i -e 's#^DIR=.*#DIR="/usr/share/et"#' "${pkgdir}/usr/bin/compile_et"

  # remove static libraries with a shared counterpart
  rm "${pkgdir}"/usr/lib/lib{com_err,e2p,ext2fs,ss}.a

  # remove chattr and lsattr in favor of busybox
  rm "${pkgdir}"/usr/bin/{ch,ls}attr
}
