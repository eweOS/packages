# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=busybox
pkgver=1.38.0
pkgrel=2
pkgdesc="Utilities for rescue and embedded systems"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.busybox.net"
license=('GPL-2.0-only')
depends=("utmps")
makedepends=("ncurses" "musl" "skalibs" "linux-headers")
options=(!lto emptydirs)
backup=(
  "etc/ntp.conf"
  "etc/sysctl.conf"
)
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
  "getty.service"
  "remove_empty_dir.patch"
  "busybox-suidwrapper.c"
  "acpid.service"
  "sha256-aarch64-hwaccel.patch"
)
sha256sums=('34f9ea6ff8636f2c9241153b9114eefa9e65674a45318ae1ef95bb5f31c53bb2'
            '534c3fe820176012e36f561e8c6264300d2f2c4c7e37d33461621339d7a16ba2'
            '204a0fc1dabe7cc02a8a18bdec4637d7ddb6547042c9ee1e5f9b71cd22de2f85'
            '644321e67516c8e6869dd1f09b9dfc06d6758dec91df0bdea3cb614419a1e0d3'
            '76b310d897b03efe753969e1b917fe2e3e36beb772e2145e67638af655fad04e'
            '3709439bd12a216bd515e4f4759c69464e15d4ca0bb71b9a9838b0eccce8fd9b'
            '63044f1031a3d9405fbd23df091d4816264141241fd74730acd0b6b294b87618'
            '69e028725a63763e21684fb0ce941f6a34a4b72bb328a0cab43b4d39d6d767dc'
            '802aff2664c40867a616144cfa2c5cd0c28e53d6a07f8d78bdcdf78705244842'
            '6ebc1362e00c59005ccb70ccb663e7efcd7efb1606a7b1255d972f3585fbf901'
            '622d0a1743a127bab1fc15e5057034db52c7fa475298b8d085cfc7c046ae5537'
            'cd62d9d1ae294099b1a28e6ffb053267dd7a17ba8cfadb810bb7901292c4f89b'
            'c1b9ddd15914bcac1dccc646aaf7b2dcbc51a574eeeff5af92839a5f206c989a'
            '46619fcf3b865adff41607f1c26396f0a012e56a58228d2d64e48aa1b14f5df1')

prepare() {
  # remove_empty_dir: Fix eweOS/bugs/#2
  _patch_ $pkgname-$pkgver

  cd "$srcdir/$pkgname-$pkgver"
  sed "/CONFIG_PREFIX/s@=.*@=\"${pkgdir}/usr/\"@" \
    "${srcdir}/config" > .config
  sed -i -e 's@<none>@-lutmps@' \
    -e '/^l_list=/s@$LDLIBS@-lutmps@' \
    scripts/trylink
  # Fix depmod: buffer 67104768 too small with gz modules
  sed -i 's/64\*1024\*1024/512\*1024\*1024/' modutils/depmod.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang LDLIBS='-lutmps'
  cc -o $srcdir/busybox-suidwrapper $srcdir/busybox-suidwrapper.c
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # it takes too long to test 'md5sum-verifies-non-binary-file'
  #make HOSTCC=clang CC=clang LDLIBS='-lutmps' check
}

package() {
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
  install -d usr/share/udhcpc
  install -m 0755 "${srcdir}/udhcpc.script" \
    usr/share/udhcpc/default.script

  # acpid config dir
  install -d etc/acpi

  for service in ntpd syslogd udhcpc mdev acpid getty; do
    _dinit_install_services_ $srcdir/${service}.service
  done

  for TTYNUM in 1 2 3 4 5 6; do
    _dinit_enable_services_ getty@tty$TTYNUM
  done

  # Enable ntpd, acpid
  _dinit_enable_services_ ntpd acpid
}
