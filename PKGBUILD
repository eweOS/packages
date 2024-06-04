# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=npth
pkgver=1.7
pkgrel=1
pkgdesc='The new GNU portable threads library'
arch=(x86_64 aarch64 riscv64)
url="https://www.gnupg.org/software/npth/index.html"
license=('LGPL-2.1-or-later')
depends=('musl' 'sh')
provides=('libnpth.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	"fix-musl-build.patch")
sha512sums=('8893023bcf953a3f7c490cf8116bed323a9d4af2bea35277e919f437916fda8b8e68ded28ec1777717cf9187c504892556159cbdb8bc02ed4a8b30b3d897d244'
	    'a1019fcd7bcc276a1fda42c97cc41b14ed0130127966e3733c55235d830f095d9fe4f54cf91be52e6a5616860bbc1bc5f10c150c282987db8d83693725768542')

prepare()
{
  _patch_ "${pkgname}-${pkgver}"
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
