pkgname=(cyrus-sasl libsasl cyrus-sasl-gssapi cyrus-sasl-ldap)
pkgver=2.1.28
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url="https://www.cyrusimap.org/sasl/"
license=(custom)
makedepends=(gdbm glibc krb5 libldap openssl sqlite)
source=(https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-$pkgver/cyrus-sasl-$pkgver.tar.gz)
sha512sums=('db15af9079758a9f385457a79390c8a7cd7ea666573dace8bf4fb01bb4b49037538d67285727d6a70ad799d2e2318f265c9372e2427de9371d626a1959dd6f78')

prepare()
{
  cd $pkgname-$pkgver
  aclocal --install
  autoreconf -fiv
  sed -i "1i #include <time.h>" {lib/saslutil,plugins/cram}.c
}

build()
{
  cd $pkgname-$pkgver

  ./configure --prefix=/usr \
    --disable-werror \
    --disable-krb4 \
    --disable-macos-framework \
    --disable-otp \
    --disable-passdss \
    --disable-srp \
    --disable-srp-setpass \
    --disable-static \
    --enable-alwaystrue \
    --enable-anon \
    --enable-auth-sasldb \
    --enable-checkapop \
    --enable-cram \
    --enable-digest \
    --enable-gssapi \
    --enable-login \
    --enable-ntlm \
    --enable-plain \
    --enable-sql \
    --enable-shared \
    --enable-ldapdb \
    --with-ldap \
    --infodir=/usr/share/info \
    --mandir=/usr/share/man \
    --sbin=/usr/bin \
    --sysconfdir=/etc \
    --with-dblib=gdbm \
    --with-devrandom=/dev/urandom \
    --with-configdir='/etc/sasl2:/etc/sasl:/usr/lib/sasl2' \
    --with-saslauthd=/var/run/saslauthd \
    --without-sqlite \
    --without-mysql \
    --without-pgsql \
    --with-sqlite3=/usr/lib

  # prevent excessive overlinking by libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check()
{
  make -k check -C $pkgname-$pkgver
}

package_cyrus-sasl()
{
  depends=(gdbm libgdbm.so glibc krb5 libkrb5.so libldap libsasl=$pkgver openssl pam libpam.so)
  pkgdesc="Cyrus saslauthd SASL authentication daemon"
  backup=(etc/conf.d/saslauthd)

  make DESTDIR="$pkgdir" install -C $pkgbase-$pkgver/saslauthd
  make DESTDIR="$pkgdir" install-data-local -C $pkgbase-$pkgver/saslauthd
  install -vDm 644 $pkgbase-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # why conf.d in systemd system? figure out later
  # tmpfiles missing
}

package_cyrus-sasl-gssapi()
{
  pkgdesc="GSSAPI authentication mechanism for Cyrus SASL"
  depends=(glibc krb5 libgssapi_krb5.so libsasl=$pkgver)
  replaces=('cyrus-sasl-plugins')

  install -vdm 755 "$pkgdir/usr/lib/sasl2"
  cp -av $pkgbase-$pkgver/plugins/.libs/libgs{,sapiv}2.so* "$pkgdir/usr/lib/sasl2/"
  install -vDm 644 $pkgbase-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_cyrus-sasl-ldap()
{
  pkgdesc="ldapdb auxprop module for Cyrus SASL"
  depends=(glibc libldap libsasl=$pkgver)

  install -vdm 755 "$pkgdir/usr/lib/sasl2"
  cp -av $pkgbase-$pkgver/plugins/.libs/libldapdb.so* "$pkgdir/usr/lib/sasl2/"
  install -vDm 644 $pkgbase-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# cyrus-sasl-sql only supports sqlite now, skipping

package_libsasl()
{
  pkgdesc="Cyrus Simple Authentication Service Layer (SASL) library"
  depends=(gdbm libgdbm.so glibc openssl)
  provides=(libsasl2.so)

  local _target
  make DESTDIR="$pkgdir" install-pkgconfigDATA -C $pkgbase-$pkgver
  for _target in include lib sasldb plugins utils; do
    make DESTDIR="$pkgdir" install -C $pkgbase-$pkgver/$_target
  done
  install -vDm 644 $pkgbase-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  # remove files provided by extra/cyrus-sasl
  rm -fv "$pkgdir"/usr/lib/sasl2/lib{gs2,gssapiv2,ldapdb,sql}.so*
}
