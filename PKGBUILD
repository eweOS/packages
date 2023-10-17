# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.36.1
pkgrel=10
pkgdesc="Utilities for rescue and embedded systems"
arch=(x86_64 aarch64 riscv64)
url="https://www.busybox.net"
license=('GPL')
depends=("utmps")
makedepends=("ncurses" "musl" "skalibs" "linux-headers")
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
  "busybox-suidwrapper.c"
)
sha256sums=('b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314'
	    '8ced29f80074b9869ef39e9f7b696146680cf3092308df05014f14e8bb5d1202'
            '204a0fc1dabe7cc02a8a18bdec4637d7ddb6547042c9ee1e5f9b71cd22de2f85'
            '644321e67516c8e6869dd1f09b9dfc06d6758dec91df0bdea3cb614419a1e0d3'
            'b14b091b3a280b4e441e7ce4ba3f4869306c6a39bf477057b6002874c82f5741'
            '11ed1f511e0d8a5531650d0895ce73fa06dbbc3872dee2e8b1e88e2cecb085d4'
            'b040983cf5a5bc7a7053573cd78f583e95a90aee1a1acacdb8ee0516fea1ce9f'
            '69e028725a63763e21684fb0ce941f6a34a4b72bb328a0cab43b4d39d6d767dc'
            'a89991ff9aff1876cac2a8b66959fe56195ecb7996344beddea0b051abebd65a'
            '1a914dea6a818ecd279d28093209be535b381d9433264013f26e8e0af0880efb'
            '622d0a1743a127bab1fc15e5057034db52c7fa475298b8d085cfc7c046ae5537'
            'add7a75bc369aa2c4c167e5fe6ec3fcca2960b310a4df8e9769c9fd765b9eea2'
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
  cc -o $srcdir/busybox-suidwrapper $srcdir/busybox-suidwrapper.c
}

check()
{
  cd "$srcdir/$pkgname-$pkgver"
  # it takes too long to test 'md5sum-verifies-non-binary-file'
  #make HOSTCC=clang CC=clang LDLIBS='-lutmps' check
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang LDLIBS='-lutmps' install
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
  rm -r $pkgdir/usr/sbin

  install -m 0755 $srcdir/busybox-suidwrapper $pkgdir/usr/bin/busybox-suidwrapper
  for SUIDCMD in $($pkgdir/usr/bin/busybox-suidwrapper -l); do
    ln -sf busybox-suidwrapper $pkgdir/usr/bin/$SUIDCMD
  done
  chmod u+s $pkgdir/usr/bin/busybox-suidwrapper

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
