# Maintainer Ziyao <tswuyin_st127@163.com>

# NOTICE THE TRICKS
# 1. soft-float check is not neccessary for clang,so delete
#    lines 839-898 in configure.ac script
# 2. some binary images carry rubbish,truncate them simply

pkgbase=grub
pkgname=(grub-common grub-bios grub-efi grub-theme-starfield)
pkgver=2.06
pkgrel=1
pkgdesc="GRand Unified Bootloader, version 2"
arch=('x86_64')
url='https://www.gnu.org/software/grub/grub.html'
license=('GPLv3')
depends=('musl' 'efibootmgr')
makedepends=('lld' 'bison' 'flex' 'python' 'freetype2' 'ttf-dejavu' 'ttf-unifont' 'binutils-objcopy')
source=(
  "https://ftp.gnu.org/gnu/${pkgbase}/${pkgbase}-${pkgver}.tar.xz"
  grub.default
)
sha512sums=('SKIP' 'SKIP')

prepare() {
  cd ${pkgbase}-${pkgver} && sed -ie "839,898d" configure.ac
}

_build_args=(
  FREETYPE_LIBS="-lfreetype"
  BUILD_FREETYPE_LIBS="-lfreetype"
  --disable-werror
  --prefix=/usr
  --bindir=/usr/bin
  --sbindir=/usr/bin
  --sysconfdir="/etc"
  --with-bootdir=/boot
)

FLIST_grub_theme_starfield=(
    "usr/share/grub/themes/starfield/*"
)

FLIST_grub_common=(
    "usr/bin/*"
    "usr/share/bash-completion/*"
    "usr/share/grub/*"
    "usr/share/info/*"
    "etc/grub.d"
)

FLIST_grub_efi=(
    "usr/lib/grub/x86_64-efi/*"
)

FLIST_grub_bios=(
    "usr/lib/grub/i386-pc/*"
)

_fetchpkg() {
    PKGBASE="$srcdir/pkgs/$1" && shift
    mkdir -p $PKGBASE
    for FILEPATH in $@; do
        (cd "${srcdir}/PKGDIR" && find $FILEPATH | cpio -pdvmu $PKGBASE) || true
        (cd "${srcdir}/PKGDIR" && find $FILEPATH -delete) || true
    done
}

build() {
  mkdir -p $srcdir/binutils-bin && cp /usr/bin/binutils-objcopy $srcdir/binutils-bin/objcopy
  cp -r ${pkgbase}-${pkgver} ${pkgbase}-${pkgver}-efi
  
  cd $srcdir/${pkgbase}-${pkgver}-efi
  autoreconf -fiv
  export PATH="$srcdir/binutils-bin:$PATH"
  export CFLAGS='--ld-path=/usr/bin/ld.lld -no-pie'
  ./configure \
    --target="x86_64" \
    --with-platform="efi" \
    ${_build_args[@]}
  make
  truncate -cs 512 grub-core/diskboot.img
  truncate -cs 512 grub-core/boot.img
  make \
    DESTDIR=$srcdir/PKGDIR \
    bashcompletiondir="/usr/share/bash-completion/completions" \
    install
  
  _fetchpkg grub-theme-starfield "${FLIST_grub_theme_starfield[@]}"
  _fetchpkg grub-efi "${FLIST_grub_efi[@]}"
  _fetchpkg grub-common "${FLIST_grub_common[@]}"
  
  rm -r $srcdir/PKGDIR
  
  cd $srcdir/${pkgbase}-${pkgver}
  autoreconf -fiv
  export PATH="$srcdir/binutils-bin:$PATH"
  export CFLAGS='--ld-path=/usr/bin/ld.lld -no-pie'
  ./configure \
    --target="i386" \
    --with-platform="pc" \
    ${_build_args[@]}
  make
  truncate -cs 512 grub-core/diskboot.img
  truncate -cs 512 grub-core/boot.img
  make \
    DESTDIR=$srcdir/PKGDIR \
    bashcompletiondir="/usr/share/bash-completion/completions" \
    install
  
  _fetchpkg grub-bios "${FLIST_grub_bios[@]}"
}

package_grub-common() {
  mv "$srcdir/pkgs/grub-common/etc" "${pkgdir}"
  mv "$srcdir/pkgs/grub-common/usr" "${pkgdir}"
  install -d "${pkgdir}/etc/default"
  install "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}

package_grub-efi() {
  depends=('grub-common')
  mv "$srcdir/pkgs/grub-efi/usr" "${pkgdir}"
}

package_grub-bios() {
  depends=('grub-common')
  mv "$srcdir/pkgs/grub-bios/usr" "${pkgdir}"
}

package_grub-theme-starfield() {
  depends=('grub-common')
  mv "$srcdir/pkgs/grub-theme-starfield/usr" "${pkgdir}"
}
