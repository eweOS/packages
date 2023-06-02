# Maintainer: YukariChiba <i@0x7f.cc>

pkgbase=elogind
pkgname=('elogind' 'libelogind')
pkgver=246.10
pkgrel=5
pkgdesc="The systemd project's logind, extracted to a standalone package"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/elogind/elogind"
license=('GPL')
makedepends=('libtool' 'gperf' 'git' 'libcap' 'meson' 'pam' 'libudev' 'dbus')
source=("git+https://github.com/elogind/elogind#tag=v${pkgver}" "elogind.service")
sha256sums=('SKIP'
  '9636d9ad1d0b8d202402239a7544ed2a761b7d32ca8f424dd3d7188c1d57288d')

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
  install -D $srcdir/elogind.service $pkgdir/etc/dinit.d/elogind

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
