# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dbus
pkgver=1.16.2
pkgrel=4
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('d77cc71acd93e85f2bd2a6fe3a40e5bd023519e3e9fa9b5361e7109f42b74060'
            '5d134f6d22600337e0b577c53213d6dc9dddd83de8dcd17f8c56f632f76ed654'
            '89637ed2fef64e5f0fd67f297828242ec0d24e70468fd308c3c475f219bc815d'
            'da9ac8ffa3d3e063bce04332b58215e3741f4be4040307d0317a3ba775d3d68a'
            'ea47f0e560b61a089a4b2eadd1bb27983694ee0ef9e5f1417658a2d56f1bd620'
            '9dc77d067c5980b0945150c648e89af7a0e23d520497712cc2e5be85eb5226c4'
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

  chmod 4750 "$pkgdir/usr/lib/dbus-1.0/dbus-daemon-launch-helper"
}
