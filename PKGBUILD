# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dbus
pkgver=1.15.8
pkgrel=2
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64 riscv64)
license=(GPL custom)
depends=(expat)
makedepends=(python autoconf-archive)
source=(
  "https://gitlab.freedesktop.org/dbus/${pkgname}/-/archive/${pkgname}-${pkgver}/dbus-${pkgname}-${pkgver}.tar.gz"
  dbus.service
  dbus.user.service
  dbus-system-session
  dbus-user-session
  dbus.tmpfiles
  dbus.sysusers
)
sha256sums=('3ae23cd28b96beac175eab0798d65c8e21e9fcf57132d840c170aaa7b21cd818'
            'f8facf3b2d72c2638db93d7933b633536165ae749966eb4f81f2a877e4eaad84'
            '16d5a4e3025b8c24f82ca37fa97b066b18efa872b84718e9a6c674da5d1a164e'
            'da9ac8ffa3d3e063bce04332b58215e3741f4be4040307d0317a3ba775d3d68a'
            'ea47f0e560b61a089a4b2eadd1bb27983694ee0ef9e5f1417658a2d56f1bd620'
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
  rm -r "$pkgdir"/usr/lib/systemd

  install -D "${srcdir}/dbus.service" "$pkgdir/etc/dinit.d/dbus"
  install -D "${srcdir}/dbus.user.service" "$pkgdir/usr/lib/dinit.d/user/dbus"
  install -Dm755 "${srcdir}/dbus-system-session" "$pkgdir/usr/lib/dinit/exec/dbus-system-session"
  install -Dm755 "${srcdir}/dbus-user-session" "$pkgdir/usr/lib/dinit/exec/user/dbus-user-session"
  install -D "${srcdir}/dbus.tmpfiles" "$pkgdir/etc/tmpfiles.d/dbus.conf"
  install -D "${srcdir}/dbus.sysusers" "$pkgdir/usr/lib/sysusers.d/dbus.conf"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus-${pkgname}-${pkgver}/COPYING
}
