# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>
pkgname=dinit
pkgver=0.15.1
pkgrel=2
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
_gitrev="d12abca7ec470de62a15efbaf3ef79befc1e6d13"
source=(
  $pkgname-$pkgver.tar.gz::"https://github.com/davmac314/${pkgname}/archive/${_gitrev}.tar.gz"
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
  ttyS0.service
  login.target
  hostname.rc
  interfaces.rc
)
arch=(x86_64)
license=(Apache)
makedepends=(make utmps)
options=(emptydirs)
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
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$pkgname-$_gitrev"
  # OBS can't run environ check normally
  patch -p1 < $srcdir/disable_environ_check.patch
  # Disable LTO
  sed -i 's/-flto//g' configs/mconfig.Linux.sh
}

build() {
  cd "$pkgname-$_gitrev"
  make all \
       CXXOPTS="-std=c++11 -fno-rtti" \
       SBINDIR="/usr/bin" \
       BUILD_SHUTDOWN=yes \
       SANITIZEOPTS="-fsanitize=address,undefined" \
       USE_UTMPX=1
}

check() {
  cd "$pkgname-$_gitrev"
  make check
  make check-igr
}

package() {
  cd "$pkgname-$_gitrev"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -d ${pkgdir}/etc/dinit.d
  install ${srcdir}/rcboot.sh ${pkgdir}/etc/dinit.d/rcboot.sh
  install -d ${pkgdir}/etc/dinit.d/boot.d
  install -d ${pkgdir}/etc/dinit.d/prerun.d
  install -d ${pkgdir}/etc/rcboot.d
  ln -s dinit ${pkgdir}/usr/bin/init

  for f in `ls ${srcdir}/*.service`; do
    servicename=`echo $f | cut -d "." -f 1`
    install $f ${pkgdir}/etc/dinit.d/${servicename##*/}
  done

  for f in `ls ${srcdir}/*.target`; do
    targetname=`echo $f | cut -d "." -f 1`
    install $f ${pkgdir}/etc/dinit.d/target-${targetname##*/}
  done

  for f in `ls ${srcdir}/*.sh`; do
    install $f ${pkgdir}/etc/dinit.d/${f##*/}
  done

  for f in `ls ${srcdir}/*.rc`; do
    install $f ${pkgdir}/etc/rcboot.d/${f##*/}
  done

}

