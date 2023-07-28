# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=npth
pkgver=1.6
pkgrel=3
pkgdesc='The new GNU portable threads library'
arch=(x86_64 aarch64 riscv64)
url="https://www.gnupg.org/software/npth/index.html"
license=('LGPL2.1')
depends=('musl' 'sh')
provides=('libnpth.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('2ed1012e14a9d10665420b9a23628be7e206fd9348111ec751349b93557ee69f1176bcf7e6b195b35b1c44a5e0e81ee33b713f03d79a33d1ecd9037035afeda2')

prepare()
{
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "${pkgname}-${pkgver}"
  make check
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 {README,NEWS,ChangeLog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
