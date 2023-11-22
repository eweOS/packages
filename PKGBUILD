# Maintainer: YukariChiba <i@0x7f.cc>

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=246.10
pkgrel=6
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/elogind/elogind"
license=('GPL')
makedepends=('libtool' 'gperf' 'git' 'libcap' 'meson' 'pam' 'libudev' 'dbus')
source=("git+https://github.com/elogind/elogind#tag=v${pkgver}" "elogind.service")
sha256sums=('SKIP'
  '1f0fc01a70cba42d6ad226fbf0c512f322623ca02c4fa8bf20efb26fc247467a')

prepare()
{
  # busybox does not support relative path in realpath
  sed -i "s@relative_source_path = .*@relative_source_path = \'../build\'@g" $pkgbase/meson.build
  sed -i '43d;44d' $pkgbase/meson.build
}

build()
{
  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE" ewe-meson $pkgbase build \
    -D rootprefix=/usr \
    -D smack=true \
    -D acl=true \
    -D pam=true \
    -D rootlibexecdir=/usr/lib \
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

  rm -rf "$pkgdir"/usr/share/doc
}

package_libelogind()
{
  pkgdesc="elogind client libraries"
  provides=('libelogind.so' "libelogind=${pkgver}")
  depends=('libcap')

  mv pkgs/libelogind/* "$pkgdir"
}
