# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efivar
pkgdesc="Tools and libraries to work with EFI variables"
pkgver=39
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url="https://github.com/rhboot/efivar"
license=(LGPL2.1)
depends=(musl)
makedepends=(linux-headers git lld)
source=(
  "git+${url}.git#tag=${pkgver}"
)
sha256sums=('SKIP')

prepare()
{
  # currently we do not have mandoc
  sed -i 's:docs::g' $pkgname/Makefile
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
