# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pam
pkgver=1.7.0
pkgrel=1
pkgdesc="PAM (Pluggable Authentication Modules) library"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
url="http://linux-pam.org"
depends=('musl' 'libxcrypt' 'utmps')
makedepends=('flex' 'linux-headers' 'meson' 'git')
source=(
  "pam::git+https://github.com/linux-pam/linux-pam#tag=v${pkgver}"
  "disable-i18n.patch::https://github.com/linux-pam/linux-pam/commit/900c9c82e0c703fee1f5c55fb4a0913a7fc95306.patch"
  "$pkgname.tmpfiles"
)
sha256sums=('66ba7e8d6f8d1b985432a07180280e5bbc8c84bfc43fab7b1e071c26a04e2bde'
            '62acdad6764a44b8a10c40e012087814f30faa5b0931ad35bb1f8127f620ed47'
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
    -Di18n=disabled
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
}
