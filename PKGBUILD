# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pam
pkgver=1.7.2
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later OR BSD-3-Clause')
url="http://linux-pam.org"
depends=('musl' 'libxcrypt' 'utmps')
makedepends=('flex' 'linux-headers' 'meson' 'git')
source=(
  "pam::git+https://github.com/linux-pam/linux-pam#tag=v${pkgver}"
  "$pkgname.tmpfiles"
)
sha256sums=('4fc9be25be6da8fd1cb0b42af4106ed309132c00bff48212ccfffb21a40683d0'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')
options=('!emptydirs')
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so')
backup=(etc/environment
        etc/security/{access,faillock,group,limits,namespace,pam_env,pwhistory,time}.conf
	etc/security/namespace.init)

prepare() {
  _patch_ "${pkgname}"
}

build()
{
  LDFLAGS+=" -Wl,--undefined-version"
  ewe-meson "${pkgname}" build \
    -Dlogind=disabled \
    -Dnis=disabled \
    -Deconf=disabled \
    -Dselinux=disabled \
    -Dpam_userdb=disabled \
    -Daudit=disabled \
    -Ddocs=disabled \
    -Di18n=disabled \
    -Delogind=disabled
  meson compile -C build
}

package()
{
  # base config
  depends+=(pambase)
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf

  # set unix_chkpwd uid
  chmod +s "${pkgdir}"/usr/bin/unix_chkpwd

  # remove systemd dir
  rm -r $pkgdir/usr/lib/systemd

  _install_license_ "$srcdir/$pkgname/COPYING"
}
