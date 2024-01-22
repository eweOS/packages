# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.36.1
pkgrel=14
pkgdesc="Utilities for rescue and embedded systems"
arch=(x86_64 aarch64 riscv64)
url="https://www.busybox.net"
license=('GPL')
depends=("utmps")
makedepends=("ncurses" "musl" "skalibs" "linux-headers")
options=(!lto)
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
  "getty.service"
  "remove_empty_dir.patch"
  "busybox-suidwrapper.c"
  "mdev-helper-settle-nics"
  "mdev-helper-sound-control"
  "mdev-helper-storage-device"
  "mdev-helper-dev-bus-usb"
)
sha256sums=('b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314'
            'e7b000e40c61635484b4591b67af648df08e4906799ab4156fa7377b411accc3'
            '204a0fc1dabe7cc02a8a18bdec4637d7ddb6547042c9ee1e5f9b71cd22de2f85'
            '644321e67516c8e6869dd1f09b9dfc06d6758dec91df0bdea3cb614419a1e0d3'
            '9c69f0ef1da1d48d1aa36c0925366f240b3a42f2ccd43bea54b5ee95ef9316d2'
            '196466ec42eec6ee769575aae6e89e4f434b064fe4533c33eefff181f0a02bc3'
            'a54856a9825e3aeb161a19c0665fa6f98695a4cf15ca66d864a8dbed0f6268fe'
            '69e028725a63763e21684fb0ce941f6a34a4b72bb328a0cab43b4d39d6d767dc'
            'd090013b1537d43c3925bf69cb6bcd8ca304b91774ceb1b944ae6edd8714ad1f'
            'b71d64c21669027c9f9bd87818ed5ad5a3b93199b859b87b2e517b2c6148140e'
            '71a1983dfb80a34e3c11faab1aa490dd2edb2e057fa1db18cbce96a67a3398c3'
            '622d0a1743a127bab1fc15e5057034db52c7fa475298b8d085cfc7c046ae5537'
            'add7a75bc369aa2c4c167e5fe6ec3fcca2960b310a4df8e9769c9fd765b9eea2'
            'd6dc8bd5e9123e9352acfbb8754afe8e44a0a1e0a4539d309f7193a1d5ddc0fe'
            'f157359b7992e9d08da728b2c48c10f338e149e44856f3cb9665164c35f6e232'
            'f641a4d722dfaeb70e43ee87d8b1ce6ecadc0aec4ee21bdc28bbe4564dd743f4'
            '32c89049dfcb5de3b2591b1039b25aa8ad83f0af9b6782ef460ed4dde7a8493d')

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

  for helper in dev-bus-usb settle-nics sound-control storage-device; do
    install -Dm 0755 "$srcdir/mdev-helper-$helper" $pkgdir/usr/bin/mdev-helper-$helper
  done

  _dinit_install_services_ $srcdir/ntpd.service
  _dinit_install_services_ $srcdir/syslogd.service
  _dinit_install_services_ $srcdir/udhcpc.service
  _dinit_install_services_ $srcdir/mdev.service
  for TTYNUM in 2 3 4 5 6
  do
    cat ${srcdir}/getty.service | sed "s/@TTYNUM@/$TTYNUM/g" > $srcdir/getty-tty$TTYNUM
    _dinit_install_services_ $srcdir/getty-tty$TTYNUM
  done

  # Enable tty2 and ntpd
  _dinit_enable_services_ getty-tty2 ntpd
}
