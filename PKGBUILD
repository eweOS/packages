# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.37.0
pkgrel=3
pkgdesc="Utilities for rescue and embedded systems"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.busybox.net"
license=('GPL')
depends=("utmps")
makedepends=("ncurses" "musl" "skalibs" "linux-headers")
options=(!lto emptydirs)
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
  "acpid.service"
  "detect-compressed-module.patch"
  "modprobe-S-option.patch"
  "modinfo-k-option.patch"
  "sha-ni.patch"
)
sha256sums=('3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4'
            '38dc71d9bccce4b675b3c2e0aab4b86cbaedac05180a6561acc76ea6179add59'
            '204a0fc1dabe7cc02a8a18bdec4637d7ddb6547042c9ee1e5f9b71cd22de2f85'
            '644321e67516c8e6869dd1f09b9dfc06d6758dec91df0bdea3cb614419a1e0d3'
            '9c69f0ef1da1d48d1aa36c0925366f240b3a42f2ccd43bea54b5ee95ef9316d2'
            '196466ec42eec6ee769575aae6e89e4f434b064fe4533c33eefff181f0a02bc3'
            'a54856a9825e3aeb161a19c0665fa6f98695a4cf15ca66d864a8dbed0f6268fe'
            '69e028725a63763e21684fb0ce941f6a34a4b72bb328a0cab43b4d39d6d767dc'
            'd090013b1537d43c3925bf69cb6bcd8ca304b91774ceb1b944ae6edd8714ad1f'
            '9c6d96a3e0d044d0ebb39e00bcad0eceb98001146c807eea98b0685076ed1945'
            '71a1983dfb80a34e3c11faab1aa490dd2edb2e057fa1db18cbce96a67a3398c3'
            '622d0a1743a127bab1fc15e5057034db52c7fa475298b8d085cfc7c046ae5537'
            '3557692ba310fc114459819f690fdf76047d67c8146dddbb4cc9ad7b8d931b64'
            'd6dc8bd5e9123e9352acfbb8754afe8e44a0a1e0a4539d309f7193a1d5ddc0fe'
            'f157359b7992e9d08da728b2c48c10f338e149e44856f3cb9665164c35f6e232'
            'f641a4d722dfaeb70e43ee87d8b1ce6ecadc0aec4ee21bdc28bbe4564dd743f4'
            '32c89049dfcb5de3b2591b1039b25aa8ad83f0af9b6782ef460ed4dde7a8493d'
            'db93d29f439b25a174216898915f92fc6e092042d27a07e0bdf58ea277e80085'
            '0b92c82c56bf9d81da6a1b64742b313ea11a483cfaf2a7ebb5a68e7f5258471c'
            '0f54301a73af461e8066bc805b48d991cfed513d08a2f036e015b19f97cb424a'
            'e6e3db7a22a1cddc547fc405f3439e1c755b8c534849f199c4c800cf0e84237a'
            'e44e31f3beea7cc4cce72ad93834b9491da35ccce01fe6d16e321692bdeb988e')

prepare() {
  # remove_empty_dir: Fix eweOS/bugs/#2  
  # detect-compressed-module: Fix dmesg like 'Invalid ELF header magic: != ELF'
  # sha-ni: Fix missing sha-NI guard
  # modprobe-S-option: add -S option for modprobe for tinyramfs
  # modinfo-k-option: add -k option for modinfo for tinyramfs
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
  install -m 0644 "${srcdir}/mdev.conf" etc/
  install -d usr/share/udhcpc
  install -m 0755 "${srcdir}/udhcpc.script" \
    usr/share/udhcpc/default.script

  # acpid config dir
  install -d etc/acpi

  for helper in dev-bus-usb settle-nics sound-control storage-device; do
    install -Dm 0755 "$srcdir/mdev-helper-$helper" $pkgdir/usr/bin/mdev-helper-$helper
  done

  for service in ntpd syslogd udhcpc mdev acpid; do
    _dinit_install_services_ $srcdir/${service}.service
  done

  for TTYNUM in 1 2 3 4 5 6; do
    cat ${srcdir}/getty.service | sed "s/@TTYNUM@/$TTYNUM/g" > $srcdir/getty-tty$TTYNUM
    _dinit_install_services_ $srcdir/getty-tty$TTYNUM
    _dinit_enable_services_ getty-tty$TTYNUM
  done

  # Enable ntpd, acpid
  _dinit_enable_services_ ntpd acpid
}
