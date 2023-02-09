# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dbus
pkgver=1.14.0
pkgrel=3
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64)
license=(GPL custom)
depends=(expat)
makedepends=(python autoconf-archive)
source=(
  "https://gitlab.freedesktop.org/dbus/${pkgname}/-/archive/${pkgname}-${pkgver}/dbus-${pkgname}-${pkgver}.tar.gz"
  dbus.service
  dbus.tmpfiles
  dbus.sysusers
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare()
{
  cd dbus-${pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build()
{
  cd dbus-${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    --runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --enable-inotify \
    --enable-user-session \
    --disable-static \
    --without-x
  make
}

package()
{
  DESTDIR="$pkgdir" make -C dbus-${pkgname}-${pkgver} install

  rm -r "$pkgdir"/{etc,var}

  install -D "${srcdir}/dbus.service" "$pkgdir/etc/dinit.d/dbus"
  install -D "${srcdir}/dbus.tmpfiles" "$pkgdir/etc/tmpfiles.d/dbus.conf"
  install -D "${srcdir}/dbus.sysusers" "$pkgdir/usr/lib/sysusers.d/dbus.conf"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus-${pkgname}-${pkgver}/COPYING
}
