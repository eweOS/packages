# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5
pkgver=1.21.3
_pkgvermajor=${pkgver%.*}
pkgrel=1
pkgdesc='The Kerberos network authentication system'
url='https://web.mit.edu/kerberos/'
arch=(x86_64 aarch64 riscv64)
license=('custom')
depends=('musl' 'libverto' 'e2fsprogs' 'openssl')
makedepends=('perl')
provides=(
  libgssapi_krb5.so
  libgssrpc.so
  libk5crypto.so
  libkadm5clnt_mit.so
  libkadm5srv_mit.so
  libkdb5.so
  libkdb_ldap.so
  libkrad.so
  libkrb5.so
  libkrb5support.so
)
backup=(
  'etc/krb5.conf'
  'var/lib/krb5kdc/kdc.conf'
)
options=('!emptydirs')
source=(https://web.mit.edu/kerberos/dist/krb5/${_pkgvermajor}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('87bc06607f4d95ff604169cea22180703a42d667af05f66f1569b8bd592670c42820b335e5c279e8b4f066d1e7da20f1948a1e4def7c5d295c170cbfc7f49c71')

prepare()
{
  cd ${pkgname}-${pkgver}

  # FS#25384
  sed -i "/KRB5ROOT=/s/\/local//" src/util/ac_check_krb5.m4
}

build()
{
  cd ${pkgname}-${pkgver}/src
  export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
  export CPPFLAGS+=" -I/usr/include/et"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --enable-shared \
    --with-system-et \
    --with-system-ss \
    --disable-rpath \
    --without-tcl \
    --enable-dns-for-realm \
    --without-ldap \
    --with-system-verto
  make
}

package()
{
  cd ${pkgname}-${pkgver}/src
  make DESTDIR="${pkgdir}" EXAMPLEDIR=/usr/share/doc/${pkgname}/examples install

  # Fix FS#29889
  install -m 644 plugins/kdb/ldap/libkdb_ldap/kerberos.{ldif,schema} \
    "${pkgdir}/usr/share/doc/${pkgname}/examples"

  install -Dpm 644 config-files/krb5.conf -t "${pkgdir}/etc"
  install -Dpm 644 config-files/kdc.conf -t "${pkgdir}/var/lib/krb5kdc"

  install -Dm 644 util/ac_check_krb5.m4 -t "${pkgdir}/usr/share/aclocal"

  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver}/NOTICE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et:
