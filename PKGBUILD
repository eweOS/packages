# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efivar
pkgdesc="Tools and libraries to work with EFI variables"
pkgver=38
pkgrel=3
arch=(x86_64 aarch64)
url="https://github.com/rhboot/efivar"
license=(LGPL2.1)
depends=(musl)
makedepends=(linux-headers git lld)
_commit=bc65d63ebf8fe6ac8a099ff15ca200986dba1565
source=(
  "git+${url}.git#commit=${_commit}"
  "$url/commit/3778ed47d539a716301ba2e67ba62f796e2df310.patch"
)
sha256sums=('SKIP'
  'bc5bdc48ecb5df461fb0eb1b69be642ccedcb53f286da532e2794d23e9f4f6e1')

prepare()
{
  # currently we do not have mandoc
  sed -i 's:docs::g' $pkgname/Makefile
  # Revamp efi_well_known_* variable handling, patch for clang+lld 15
  cd $pkgname && patch -p1 < ../3778ed47d539a716301ba2e67ba62f796e2df310.patch
}

build()
{
  # mold is not supported, add D_LARGEFILE64_SOURCE to fix for musl 1.2.4
  export LD=ld.lld CFLAGS='--ld-path=/usr/bin/ld.lld -D_LARGEFILE64_SOURCE'
  # disable -Werror by default by setting ERRORS to empty string
  make ERRORS='' all -C "${pkgname}"
}

package()
{
  make DESTDIR="${pkgdir}/" \
    libdir=/usr/lib/ \
    bindir=/usr/bin/ \
    includedir=/usr/include/ \
    install -j1 V=1 \
    -C "${pkgname}"
  install -vDm 644 "${pkgname}/"{README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
