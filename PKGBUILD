# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=util-linux
pkgname=(util-linux util-linux-libs)
pkgver=2.41.1
pkgrel=2
pkgdesc='Miscellaneous system utilities for Linux'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/karelzak/util-linux
license=(
  'BSD-2-Clause'
  'BSD-3-Clause'
  'BSD-4-Clause-UC'
  'GPL-2.0-only'
  'GPL-2.0-or-later'
  'GPL-3.0-or-later'
  'ISC'
  'LGPL-2.1-or-later'
  'LicenseRef-PublicDomain'
)
makedepends=('meson' 'pam' 'bash-completion' 'linux-headers')
source=(
  "util-linux-${pkgver}.tar.gz::https://github.com/karelzak/util-linux/archive/refs/tags/v${pkgver}.tar.gz"
  $pkgbase-BSD-2-Clause.txt::https://raw.githubusercontent.com/Cyan4973/xxHash/f035303b8a86c1db9be70cbb638678ef6ef4cb2d/LICENSE
  pam-{login,common,remote,runuser,su}
  'util-linux.sysusers'
)
sha256sums=('61a9785cbf04091286ec2bbfb78e87c35e6380f084f38115a4677b90b9ad4437'
            '6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a'
            'ee917d55042f78b8bb03f5467e5233e3e2ddc2fe01e302bc53b218003fe22275'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '8bfbee453618ba44d60ba7fb00eced6c62edebfc592f2e75dede08e769ed8931'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '3f54249ac2db44945d6d12ec728dcd0d69af0735787a8b078eacd2c67e38155b'
            '4a0b3dd8aa6d34dd29e1d153f396cacf908b0d64f7218276cbcab684587c0a0a')

prepare() {
  _patch_ "$pkgbase-$pkgver"
  sed -i 's/srf/sf/' "$pkgname-$pkgver/libmount/meson.build"
  sed -i 's/srf/sf/' "$pkgname-$pkgver/liblastlog2/meson.build"
  sed -i '1i #include<asm-generic/unistd.h>' "$pkgname-$pkgver/include/mount-api-utils.h"
}

build() {
  local _meson_options=(
    -Dfs-search-path=/usr/bin:/usr/local/bin

    -Dlibuser=disabled
    -Dlibutempter=disabled
    -Dncurses=disabled
    -Dncursesw=enabled
    -Deconf=disabled
    -Dsystemd=disabled
    -Dcryptsetup=disabled
    -Dnls=disabled

    -Dbuild-exch=disabled
    -Dbuild-waitpid=disabled
    -Dbuild-col=disabled
    
    -Dbuild-setpriv=disabled

    -Dbuild-chfn-chsh=enabled
    -Dbuild-line=disabled
    -Dbuild-mesg=enabled
    -Dbuild-newgrp=enabled
    -Dbuild-vipw=enabled
    -Dbuild-write=enabled
  )
  ewe-meson "$pkgbase-$pkgver" build "${_meson_options[@]}"
  meson compile -C build
}

package_util-linux() {
  depends=('util-linux-libs' 'pam' 'libudev')

  backup=(etc/pam.d/chfn
          etc/pam.d/chsh
          etc/pam.d/login
          etc/pam.d/remote
          etc/pam.d/runuser
          etc/pam.d/runuser-l
          etc/pam.d/su
          etc/pam.d/su-l)
  
  DESTDIR="${pkgdir}" meson install -C build

  # remove static libraries
  rm "${pkgdir}"/usr/lib/lib*.a*

  # setuid chfn and chsh
  chmod 4755 "${pkgdir}"/usr/bin/{newgrp,ch{sh,fn}}

  # install PAM files for login-utils
  install -Dm0644 pam-common "${pkgdir}/etc/pam.d/chfn"
  install -m0644 pam-common "${pkgdir}/etc/pam.d/chsh"
  install -m0644 pam-login "${pkgdir}/etc/pam.d/login"
  install -m0644 pam-remote "${pkgdir}/etc/pam.d/remote"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser"
  install -m0644 pam-runuser "${pkgdir}/etc/pam.d/runuser-l"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su"
  install -m0644 pam-su "${pkgdir}/etc/pam.d/su-l"

  # runtime libs are shipped as part of util-linux-libs
  install -d -m0755 util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/lib*.so* util-linux-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig util-linux-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include util-linux-libs/include

  # install sysusers
  install -Dm0644 util-linux.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/util-linux.conf"

  install -vDm 644 $pkgbase-$pkgver/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgbase-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_util-linux-libs() {
  pkgdesc='util-linux runtime libraries'
  provides=('libutil-linux' lib{blkid,fdisk,lastlog2,mount,smartcols,uuid}.so)

  install -d -m0755 "$pkgdir"/{usr/lib/,usr/share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include

  install -vDm 644 $pkgbase-$pkgver/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgbase-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
