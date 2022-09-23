pkgname=cyrus-sasl
pkgver=2.1.28
pkgrel=1
pkgdesc="Cyrus Simple Authentication Service Layer service and library"
arch=(x86_64)
url="https://www.cyrusimap.org/sasl/"
license=(custom)
depends=(gdbm musl openssl)
makedepends=(sqlite krb5)
provides=(libsasl2.so)
source=(https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-$pkgver/cyrus-sasl-$pkgver.tar.gz)
sha512sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  aclocal --install
  autoreconf -fiv
  sed -i "1i #include <time.h>" {lib/saslutil,plugins/cram}.c
}

build() {
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

check() {
  make -k check -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
