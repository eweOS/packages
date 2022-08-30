# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.35.0
pkgrel=1
pkgdesc="Utilities for rescue and embedded systems"
arch=("x86_64")
url="https://www.busybox.net"
license=('GPL')
makedepends=("ncurses" "musl" "skalibs" "utmps" "linux")
source=(
	"$url/downloads/$pkgname-$pkgver.tar.bz2"
        "config"
	"sysctl.conf"
	"ntp.conf"
	"ntpd.log.service"
	"ntpd.service"
	"syslogd.log.service"
	"syslogd.service"
	"udhcpc.script"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed "/CONFIG_PREFIX/s@=.*@=\"${pkgdir}/usr/\"@" \
        "${srcdir}/config" >.config
    make HOSTCC=clang CC=clang
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make HOSTCC=clang CC=clang install
    chmod u+s ${pkgdir}/usr/bin/busybox
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin

    cd $pkgdir
    # Config Files
    install -d etc
    install -m 0644 "${srcdir}/sysctl.conf" etc/
    install -m 0644 "${srcdir}/ntp.conf" etc/
    install -d usr/share/udhcpc
    install -m 0755 "${srcdir}/udhcpc.script" \
        usr/share/udhcpc/default.script

    # NTP Service
    install -d etc/s6/services/available/ntpd/log
    install -m 0754 "${srcdir}/ntpd.service" etc/s6/services/available/ntpd/run
    install -m 0754 "${srcdir}/ntpd.log.service" etc/s6/services/available/ntpd/log/run


    # Syslogd Service
    install -d etc/s6/services/available/syslogd/log
    install -m 0754 "${srcdir}/syslogd.service" etc/s6/services/available/syslogd/run
    install -m 0754 "${srcdir}/syslogd.log.service" etc/s6/services/available/syslogd/log/run

}
