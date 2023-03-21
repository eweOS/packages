# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.36.0
pkgrel=6
pkgdesc="Utilities for rescue and embedded systems"
arch=("x86_64" "aarch64")
url="https://www.busybox.net"
license=('GPL')
depends=("utmps")
makedepends=("ncurses" "musl" "skalibs" "linux")
source=(
  "$url/downloads/$pkgname-$pkgver.tar.bz2"
  "config"
  "sysctl.conf"
  "ntp.conf"
  "ntpd.service"
  "syslogd.service"
  "udhcpc.service"
  "udhcpc.script"
  "mdev.service"
  "mdev.conf"
  "remove_empty_dir.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  sed "/CONFIG_PREFIX/s@=.*@=\"${pkgdir}/usr/\"@" \
    "${srcdir}/config" > .config
  sed -i -e 's@<none>@-lutmps@' \
    -e '/^l_list=/s@$LDLIBS@-lutmps@' \
    scripts/trylink
  # Fix eweOS/bugs/#2
  patch -p1 < ../remove_empty_dir.patch
}

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang LDLIBS='-lutmps'
}

check()
{
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang LDLIBS='-lutmps' check
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang LDLIBS='-lutmps' install
  chmod u+s ${pkgdir}/usr/bin/busybox
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
  rm -r $pkgdir/usr/sbin

  cd $pkgdir
  # Config Files
  install -d etc
  install -m 0644 "${srcdir}/sysctl.conf" etc/
  install -m 0644 "${srcdir}/ntp.conf" etc/
  install -m 0644 "${srcdir}/mdev.conf" etc/
  install -d usr/share/udhcpc
  install -m 0755 "${srcdir}/udhcpc.script" \
    usr/share/udhcpc/default.script

  install -d etc/dinit.d
  install -d etc/dinit.d/boot.d

  # NTP Service
  install -m 0754 "${srcdir}/ntpd.service" etc/dinit.d/ntpd
  ln -s "../ntpd" etc/dinit.d/boot.d/ntpd

  # Syslogd Service
  install -m 0754 "${srcdir}/syslogd.service" etc/dinit.d/syslogd

  # DHCP Service
  install -m 0754 "${srcdir}/udhcpc.service" etc/dinit.d/udhcpc

  # mdev Service
  install -m 0754 "${srcdir}/mdev.service" etc/dinit.d/mdev
}
