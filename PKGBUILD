# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>
pkgname=dinit
pkgver=0.16.1
pkgrel=4
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=(
  $pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
  disable_environ_check.patch
  boot.service
  early-filesystems.service
  early-filesystems.sh
  modules.service
  modules.sh
  rcboot.service
  rcboot.sh
  rootrw.service
  tty1.service
  tty2.service
  ttyInit.service
  login.target
  hostname.rc
  interfaces.rc
)
arch=(x86_64 aarch64 riscv64)
license=(Apache)
makedepends=(make utmps)
options=(emptydirs)
sha256sums=('fecab916da569e7fda1ad7651eb2cc639885ac203f4729d55612108b69cd5140'
            'feb964fb18dcd691eff4cea2fb6c80cfc8ab883c8c595004bae97905debd63b0'
            'b03a4df6b0217292de807aba6e6b360aacc7276a5ce9e8fa1654885478b94b20'
            '9bd74423a26b688adcd417840ab4fdf9283db9f04ae921559021a29bb946733b'
            '0cffb7032917a8d832f5f6b140aee8e420cbea30b6fa95c40905a01d3fc784b5'
            'f60cf5cce51a18f44937589cdbf35fdb45b9dd49f75adae4f9d11f60a38db002'
            '68300173adf5f71db5093dc2dfc309e94956e7bee6f29de3d3724ea33de40f16'
            'a9490bd29abfd9339fd8b507246334d57f161b1ac6965b9f57c826313f7f173a'
            '65c0900caf904a6e94c3842e22aecdbcf8b94f1220994080b0c90a124dab5d46'
            '10fc4d8b6ddd71005f59e110db159d61a6b79a8d2b76955e640abdb7ea35f994'
            'ad3c797ff804ca9a79d00e6b0706cff5689d114b3c121e6530e2ae894e7a8908'
            'da3dbdda274980eb7b77f178ad994ff073505bb351094114467005351697bb6c'
            '5a51d71f1f9ec5dc5638fc829933e918488aa0ee63d75f1394b07ac83eedecc7'
            '6cffef2975f21fc5063768c037866649cce99d0708ce1a40d4017f349a16a9dc'
            'cb224ab5dced91d0b384ef21bdea611f6b5a7d0b3529f3f77062b88bff5b1edf'
            '5e31dcde904851a33f68d1d9ed0cbcf955224ece8738a6964a4adba03fe12f98')

prepare()
{
  cd "$pkgname-$pkgver"
  # OBS can't run environ check normally
  patch -p1 < $srcdir/disable_environ_check.patch
  # Disable LTO
  sed -i 's/-flto//g' configs/mconfig.Linux.sh
}

build()
{
  case $CARCH in
    x86_64)
      export inittty=ttyS0
      ;;
    aarch64)
      export inittty=ttyAMA0
      ;;
  esac
  sed -i "s:ttyInit:${inittty}:g" ttyInit.service
  cd "$pkgname-$pkgver"
  make all \
    CXXOPTS="-std=c++11 -fno-rtti" \
    SBINDIR="/usr/bin" \
    BUILD_SHUTDOWN=yes \
    SANITIZEOPTS="-fsanitize=address,undefined" \
    USE_UTMPX=1
}

check()
{
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package()
{
  depends+=(utmps pawprint busybox)
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -d ${pkgdir}/etc/dinit.d
  install ${srcdir}/rcboot.sh ${pkgdir}/etc/dinit.d/rcboot.sh
  install -d ${pkgdir}/etc/dinit.d/boot.d
  install -d ${pkgdir}/etc/dinit.d/prerun.d
  install -d ${pkgdir}/etc/rcboot.d
  ln -s dinit ${pkgdir}/usr/bin/init

  for f in $(ls ${srcdir}/*.service); do
    servicename=$(echo $f | cut -d "." -f 1)
    install $f ${pkgdir}/etc/dinit.d/${servicename##*/}
  done

  for f in $(ls ${srcdir}/*.target); do
    targetname=$(echo $f | cut -d "." -f 1)
    install $f ${pkgdir}/etc/dinit.d/target-${targetname##*/}
  done

  for f in $(ls ${srcdir}/*.sh); do
    install $f ${pkgdir}/etc/dinit.d/${f##*/}
  done

  for f in $(ls ${srcdir}/*.rc); do
    install $f ${pkgdir}/etc/rcboot.d/${f##*/}
  done

  ln -s ../rcboot ${pkgdir}/etc/dinit.d/boot.d/rcboot

}
