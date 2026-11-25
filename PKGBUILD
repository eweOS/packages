# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5
pkgver=1.22.3
_pkgvermajor=${pkgver%.*}
pkgrel=1
pkgdesc='The Kerberos network authentication system'
url='https://web.mit.edu/kerberos/'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha512sums=('0276d83dee90e76d50a506d22901e658212094c1191fc09b8510273b4bfc56195ab1dd1c80b5fd8288b4aa9323c62f0b60ab3f6227ea113b4712bc54cb144abb')

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
