# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=pacman-utils
pkgname=(libalpm pacman makepkg repo-tools)
pkgver=6.0.2
pkgrel=5
arch=(x86_64 aarch64 riscv64)
url="https://www.archlinux.org/pacman/"
license=('GPL')
makedepends=('meson' 'libarchive' 'openssl' 'ninja' 'acl' 'curl' 'xz')
checkdepends=('python')
backup=(etc/pacman.conf
  etc/makepkg.conf)
source=(
  https://sources.archlinux.org/other/pacman/pacman-$pkgver.tar.xz
  https://os-repo.ewe.moe/eweos/pacman.conf
  makepkg.conf
  function_patch.sh
  function_pick.sh
  script_warndirs.sh
)
sha256sums=('7d8e3e8c5121aec0965df71f59bedf46052c6cf14f96365c4411ec3de0a4c1a5'
  '14fe0360c81abf4dd79eae4f33934f2c0d52a81e73526d6ca48cd88b1e9ffbb9'
  'b7d0860e6763d3947bcd9c725aead7f821ef902a5246926de2c9079eb303a585'
  'f629c6979ee692ce0c1aea33ffaa2a238b08a912bb9e012872365ff603d0a977'
  '7d2ad28bef8f9f77f33929d2050244a6f29941de6ad0793b6820caee3dbd84e3'
  '775595e15aafd6199eca688b0c59ddf04162c5eccb4f6f9afa4d1925d6114d86'
)

_fetchpkg()
{
  PKGBASE="$srcdir/pkgs/$1" && shift
  mkdir -p $PKGBASE
  for FILEPATH in $@; do
    (cd "${srcdir}/PKGDIR" && find $FILEPATH | cpio -pdvmu $PKGBASE) || true
    (cd "${srcdir}/PKGDIR" && find $FILEPATH -delete) || true
  done
}

FLIST_LIBALPM=(
  'usr/include/*'
  'usr/lib/*'
  'usr/share/locale/*/LC_MESSAGES/libalpm.mo'
  'usr/share/man/man3/libalpm*'
  'usr/share/man/man5/alpm*'
  'usr/share/libalpm/hooks'
)

FLIST_PACMAN=(
  'usr/bin/pacman*'
  'usr/bin/testpkg'
  'usr/bin/vercmp'
  'usr/share/bash-completion/completions/pacman*'
  'usr/share/locale/*/LC_MESSAGES/pacman*.mo'
  'usr/share/man/man*/pacman*'
  'usr/share/man/man8/vercmp.8.gz'
  'usr/share/zsh/site-functions/_pacman'
  'var/cache/pacman/pkg/'
  'var/lib/pacman/'
)

FLIST_MAKEPKG=(
  'usr/bin/makepkg*'
  'usr/share/bash-completion/completions/makepkg*'
  'usr/share/makepkg-template/'
  'usr/share/makepkg'
  'usr/share/man/man*/makepkg*'
  'usr/share/man/man5/BUILDINFO.5.gz'
  'usr/share/man/man5/PKGBUILD.5.gz'
  'usr/share/pacman/*'
  'usr/share/pkgconfig/*'
)

FLIST_REPO_TOOLS=(
  'usr/bin/repo*'
  'usr/share/man/man*/repo-*'
)

build()
{
  case $CARCH in
    x86_64)
      makepkg_cflags="-Os -pipe -fno-plt -fstack-clash-protection -fcf-protection"
      ;;
    aarch64)
      makepkg_cflags="-march=armv8-a -Os -pipe -fno-plt"
      ;;
  esac
  sed -i ./makepkg.conf \
    -e "s|BUILD_GEN_CFLAGS|${makepkg_cflags}|g"
  cd "pacman-$pkgver"
  sed -i -e 's/EUID == 0/EUID == -1/' scripts/makepkg.sh.in
  sed -i '/bsdtar -xf .*dbfile/s@-C@--no-fflags -C@' scripts/repo-add.sh.in
  mkdir build
  cd build || return
  meson --prefix=/usr ..
  ninja --verbose

  cd ..
  DESTDIR="${srcdir}/PKGDIR" meson install -C build
  _fetchpkg libalpm ${FLIST_LIBALPM[@]}
  _fetchpkg pacman ${FLIST_PACMAN[@]}
  _fetchpkg makepkg ${FLIST_MAKEPKG[@]}
  _fetchpkg repo-tools ${FLIST_REPO_TOOLS[@]}
}

package_libalpm()
{
  pkgdesc="ALPM (i.e. Arch Linux Package Management) library"
  depends=('libarchive' 'curl' 'gettext' 'libxml2')
  provides=('libalpm.so')

  mv $srcdir/pkgs/libalpm/* "${pkgdir}"
}

package_pacman()
{
  pkgdesc="A library-based package manager with dependency support"
  depends=('bash' "libalpm=${pkgver}")

  mv $srcdir/pkgs/pacman/* "${pkgdir}"
  install -Dm644 "$srcdir/pacman.conf" "$pkgdir/etc/pacman.conf"
}

package_makepkg()
{
  pkgdesc="A script to automate the building of pacman packages"
  depends=("pacman=${pkgver}" 'fakeroot')
  groups=('base-devel')

  mv $srcdir/pkgs/makepkg/* "${pkgdir}"
  install -Dm644 "$srcdir/makepkg.conf" "$pkgdir/etc/makepkg.conf"
  install -Dm644 "$srcdir/function_patch.sh" "$pkgdir/usr/share/makepkg/function_patch.sh"
  install -Dm644 "$srcdir/function_pick.sh" "$pkgdir/usr/share/makepkg/function_pick.sh"
  install -Dm644 "$srcdir/script_warndirs.sh" "$pkgdir/usr/share/makepkg/lint_package/warndirs.sh"
}

package_repo-tools()
{
  pkgdesc="Pacman package database maintenance utility"
  depends=("pacman")

  mv $srcdir/pkgs/repo-tools/* "${pkgdir}"
}
