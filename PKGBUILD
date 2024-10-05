# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dbus
pkgver=1.15.10
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later custom)
depends=(musl expat glib)
makedepends=(python linux-headers meson ninja libxslt docbook-xsl)
source=(
  "https://gitlab.freedesktop.org/dbus/${pkgname}/-/archive/${pkgname}-${pkgver}/dbus-${pkgname}-${pkgver}.tar.gz"
  dbus.service
  dbus.user.service
  dbus-system-session
  dbus-user-session
  dbus.tmpfiles
  dbus.sysusers
)
provides=(
  libdbus
  libdbus-1.so
)
sha256sums=('62e68bb53e3a0df8b32c5c316e82379d34ccc17d714891f99f6b0473bd87ed0c'
            '5d134f6d22600337e0b577c53213d6dc9dddd83de8dcd17f8c56f632f76ed654'
            '16d5a4e3025b8c24f82ca37fa97b066b18efa872b84718e9a6c674da5d1a164e'
            'da9ac8ffa3d3e063bce04332b58215e3741f4be4040307d0317a3ba775d3d68a'
            'ea47f0e560b61a089a4b2eadd1bb27983694ee0ef9e5f1417658a2d56f1bd620'
            '7d8d45af88ad4b4e512b4d6d42bcbe982a539418f6368b56fc4bf25950484f9b'
            'fd03ccef383b40c60fa538481c276ea113709a161cc340c6db00adf99d9e7993')

build()
{
  ewe-meson "dbus-$pkgname-$pkgver" build \
    --libexecdir=/usr/lib/dbus-1.0 \
    --localstatedir=/var \
    -Druntime_dir=/run \
    -Ddbus_user=dbus \
    -Dsystem_pid_file=/run/dbus/pid \
    -Dsystem_socket=/run/dbus/system_bus_socket \
    -Dinotify=enabled \
    -Duser_session=true \
    -Dx11_autolaunch=disabled \
    -Ddoxygen_docs=disabled \
    -Dducktype_docs=disabled \
    -Dqt_help=disabled \
    -Dselinux=disabled \
    -Dapparmor=disabled \
    -Dkqueue=disabled \
    -Dlaunchd=disabled \
    -Dlibaudit=disabled \
    -Dsystemd=disabled

  meson compile -C build
}

check () {
  meson test -C build
}

package()
{
  meson install -C build --destdir="$pkgdir"

  rm -r "$pkgdir"/{etc,var}

  _dinit_install_services_ "$srcdir"/dbus.service
  _dinit_install_user_services_ "$srcdir"/dbus.user.service
  _dinit_enable_user_services_ dbus
  _dinit_install_helpers_ "$srcdir"/dbus-system-session
  _dinit_install_user_helpers_ "$srcdir"/dbus-user-session
  _install_sysusers_ "$srcdir"/dbus.sysusers
  _install_tmpfiles_ "$srcdir"/dbus.tmpfiles
  _install_license_ "$srcdir/dbus-$pkgname-$pkgver/COPYING"
}
