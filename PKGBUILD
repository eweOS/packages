# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=pacman-utils
pkgname=(libalpm pacman makepkg repo-tools)
pkgver=6.0.2
pkgrel=1
arch=('x86_64' 'aarch64')
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
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
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
      makepkg_cflags="-Os -pipe -fno-plt"
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
  #install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}

package_makepkg()
{
  pkgdesc="A script to automate the building of pacman packages"
  depends=("pacman=${pkgver}" 'fakeroot')
  groups=('base-devel')

  mv $srcdir/pkgs/makepkg/* "${pkgdir}"
  install -Dm644 "$srcdir/makepkg.conf" "$pkgdir/etc/makepkg.conf"
}

package_repo-tools()
{
  pkgdesc="Pacman package database maintenance utility"
  depends=("pacman")

  mv $srcdir/pkgs/repo-tools/* "${pkgdir}"
}
