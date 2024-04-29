# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pam
pkgver=1.6.1
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
url="http://linux-pam.org"
depends=('musl' 'libxcrypt' 'utmps')
makedepends=('flex')
source=(
  https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz
  other.pam
  auth.pam
  login.pam
)
sha256sums=('f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e'
            'd5ed59ec2157c19c87964a162f7ca84d53c19fb2bd68d3fbc1671ba8d906346f'
            'ab40a73fd3aa69f2212785e149b8c3fd112328dd152e341052145004e76d5859'
            '2462e923735fc366f57076878f157422bcb10c660a7edd44056651ebbe2cf845')
options=('!emptydirs')
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so')

build()
{
  cd Linux-PAM-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-db
  make
}

package()
{
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd

  for f in $(ls ${srcdir}/*.pam); do
    targetname=$(echo $f | cut -d "." -f 1)
    install -D $f ${pkgdir}/etc/pam.d/${targetname##*/}
  done
  # remove systemd dir
  rm -r $pkgdir/usr/lib/systemd
}
