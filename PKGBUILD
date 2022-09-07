# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=e2fsprogs
pkgname='e2fsprogs'
pkgver=1.46.5
pkgrel=1
pkgdesc='Ext2/3/4 filesystem utilities'
arch=('x86_64')
license=('GPL' 'LGPL' 'MIT')
url='http://e2fsprogs.sourceforge.net'
options=('debug')
depends=('util-linux-libs')
makedepends=('util-linux')
source=("https://www.kernel.org/pub/linux/kernel/people/tytso/${pkgbase}/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ac_cv_c_compiler_gnu=no \
  ac_cv_lib_dl_dlopen=no \
  ac_cv_path_mkdir=/bin/mkdir \
  ./configure \
      --prefix=/usr \
      --with-root-prefix='' \
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

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

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

