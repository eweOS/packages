# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dbus
pkgver=1.15.4
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
sha256sums=('dc31de363ae150d3caef7a5b5afd0b1205c74a743fe17a446a2f049a1dde5e60'
            '9a76352953f900ea655df3a98c066ed17220cf234762b1d558617ceb5be9112b'
            '7d8d45af88ad4b4e512b4d6d42bcbe982a539418f6368b56fc4bf25950484f9b'
            'fd03ccef383b40c60fa538481c276ea113709a161cc340c6db00adf99d9e7993')

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
