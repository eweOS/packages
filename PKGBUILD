# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=util-linux
pkgname=(util-linux util-linux-libs)
pkgver=2.42
pkgrel=1
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
makedepends=('meson' 'pam' 'bash-completion' 'linux-headers' 'utmps')
# 0001: Downstream, disable motd display for /usr/bin/login.
#	We prefer PAM module (pam_motd.so) to do the work on eweOS, which is
#	more configurable (could be disabled by changing pam configuration,
#	without rebuilding the program).
# 0002: Downstream, drop -r arguments when creating symlinks, which busybox ln
#	doesn't support.
# 0003: Backport 5452239f6e69 ("nsenter: Fix AT_HANDLE_FID on musl") to work
#	around missing constant AT_HANDLE_FID on musl libc.
source=(
  "util-linux-${pkgver}.tar.gz::https://github.com/karelzak/util-linux/archive/refs/tags/v${pkgver}.tar.gz"
  $pkgbase-BSD-2-Clause.txt::https://raw.githubusercontent.com/Cyan4973/xxHash/f035303b8a86c1db9be70cbb638678ef6ef4cb2d/LICENSE
  pam-{login,common,remote,runuser,su}
  'util-linux.sysusers'
  0001-login-disable-motd-display.patch
  0002-meson-create-executable-link-with-sf.patch
  0003-nsenter-Fix-AT_HANDLE_FID-on-musl.patch
)
sha256sums=('ae5db06b513ac5d42b91e131f26aa8b59da6b623eeb948567cc7a7cb2c13ccb2'
            '6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a'
            'ee917d55042f78b8bb03f5467e5233e3e2ddc2fe01e302bc53b218003fe22275'
            '57e057758944f4557762c6def939410c04ca5803cbdd2bfa2153ce47ffe7a4af'
            '8bfbee453618ba44d60ba7fb00eced6c62edebfc592f2e75dede08e769ed8931'
            '48d6fba767631e3dd3620cf02a71a74c5d65a525d4c4ce4b5a0b7d9f41ebfea1'
            '3f54249ac2db44945d6d12ec728dcd0d69af0735787a8b078eacd2c67e38155b'
            '4a0b3dd8aa6d34dd29e1d153f396cacf908b0d64f7218276cbcab684587c0a0a'
            'e6c85264cd78d5bb72957e88a1c4fb18687818cc1010e0e69e6e7bc8f9083ea6'
            '86ce89749d78ae7802d598e9a456787ff7200a83163e513b817650c3dfb5d5eb'
            '8938f94ef26f6db54b0726b9d3f987ccf3e6bf462b26b8393f01ec71510ecae3')

prepare() {
  _patch_ "$pkgbase-$pkgver"
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

    -Dbuild-getino=disabled
  )
  # We need -Wl,--as-needed to avoid overlinking, i.e., executables that don't
  # make use of UTMP functions get linked to libutmps.so. -Wl,--as-needed is
  # the default when building with meson, however, we want the extra safety.
  LDFLAGS="$LDFLAGS -Wl,--push-state -Wl,--as-needed -lutmps -Wl,--pop-state" \
    ewe-meson "$pkgbase-$pkgver" build "${_meson_options[@]}"
  meson compile -C build
}

package_util-linux() {
  depends=('musl' 'util-linux-libs' 'pam' 'libudev' 'utmps')

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
  depends=('musl')
  provides=('libutil-linux' lib{blkid,fdisk,lastlog2,mount,smartcols,uuid}.so)

  install -d -m0755 "$pkgdir"/{usr/lib/,usr/share/man/}
  mv util-linux-libs/lib/* "$pkgdir"/usr/lib/
  mv util-linux-libs/include "$pkgdir"/usr/include

  install -vDm 644 $pkgbase-$pkgver/Documentation/licenses/COPYING.{BSD*,ISC} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgbase-BSD-2-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
