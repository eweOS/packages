# Maintainer: YukariChiba <i@0x7f.cc>

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=252.9
pkgrel=2
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/elogind/elogind"
license=('GPL')
makedepends=('libtool' 'gperf' 'git' 'libcap' 'meson' 'pam' 'libudev' 'dbus' 'python')
source=(
  "git+https://github.com/elogind/elogind#tag=v${pkgver}"
  "elogind.service"
  0_fix-meson-relpath.patch
  1_elogind-252.9-musl-sigfillset.patch
  2_elogind-252.9-musl-statx.patch
  3_elogind-252.9-musl-getdents.patch
  4_elogind-252.9-musl-gshadow.patch
  5_elogind-252.9-musl-strerror_r.patch
  6_elogind-252.9-musl-more-strerror_r.patch
)
sha256sums=('SKIP'
            '409473737dd6d7a83628daa5046ebdf07ebe2e9dff587ea29edbb53c4dc039a4'
            'eabfdfa590843f67ab339ed30c0bcfe44223fb21dff63171ebe65461ca244830'
            'f7e8601e3e87a77b6ff55387d661615c7bdd19888862af27bd6ee17ee3733f3b'
            '839224c25fe748b6e771a9bd13cddc32786d31d53011528dbf9ea72695e19499'
            '66cdad6151cde8db8784bc2a67708803ecd5d031e89c2f221cf9c311765e11ff'
            '601cb539e583d4496e2d3794bea52f64acab672a146c68359b1c2a1b9f9534ed'
            '6a6a973f5da62edae45ae01445bdff6a841e79349162562a2f6ab6ceb29b8719'
            '0056b048f2030f711cfe4a84e16f5d9c56d8b33510736175aca4cfe82acfc681')

prepare()
{
  pip install jinja2
  # busybox does not support relative path in realpath
  _patch_ $pkgbase
}

build()
{
  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE" ewe-meson $pkgbase build \
    -D rootprefix=/usr \
    -D smack=true \
    -D acl=true \
    -D pam=true \
    -D rootlibexecdir=/usr/bin \
    -D polkit=false \
    -D cgroup-controller='elogind'
  ninja -C build
}

package_elogind()
{
  pkgdesc="The systemd project's logind, extracted to a standalone package"
  provides=("elogind=${pkgver}")
  depends=('libelogind' 'pam' 'acl' 'libudev' 'dbus')

  DESTDIR="${pkgdir}" meson install -C build

  _dinit_install_services_ $srcdir/elogind.service

  cd "$pkgdir"
  _pick_ libelogind usr/lib/pkgconfig
  _pick_ libelogind usr/include
  _pick_ libelogind usr/lib/libelogind*.so*

  mv usr/lib/elogind/* usr/lib && rm -r usr/lib/elogind

  rm -rf "$pkgdir"/usr/share/doc
}

package_libelogind()
{
  pkgdesc="elogind client libraries"
  provides=('libelogind.so' "libelogind=${pkgver}")
  depends=('libcap')

  mv pkgs/libelogind/* "$pkgdir"
}
