# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Long <i@hack3r.moe>

pkgbase=pacman
pkgname=(libalpm pacman repo-tools)
pkgver=6.1.0
pkgrel=3
arch=(x86_64 aarch64 riscv64)
url=https://www.archlinux.org/pacman/
license=(GPL)
makedepends=(meson libarchive openssl ninja acl curl xz gpgme)  # TODO: asciidoc doxygen
checkdepends=(python)
source=(
  https://gitlab.archlinux.org/pacman/pacman/-/archive/v$pkgver/pacman-v$pkgver.tar.gz
  pacman.conf
  makepkg.conf
  function_patch.sh
  function_dinit.sh
  function_pick.sh
  function_sysutils.sh
  function_license.sh
  script_warndirs.sh
  script_noglibc.sh
)
sha256sums=('cb98c8574e4f2b0d488418e11d20ab7b4a3f20e3110d83381cc94a4c55d277cf'
            '0865036ef04a06b00926640ac7db2275988b834f435101e8110eedf8a2e58b88'
            '4437336941ff94f75f460eb1741971081289f55cf3115df9f011ff282d0861a3'
            '6338de233368bfa76ee17353785709e282ace072eae6996c1289f0fb5b84ffc4'
            'd99d4fe5e414cb4748f4e9b20637d9fd69ec8c392e3f862edbc69b6564a52876'
            '7d2ad28bef8f9f77f33929d2050244a6f29941de6ad0793b6820caee3dbd84e3'
            '5648db8988c73588c05eccaa4329f6d3bd95ec1e39f2337eb1f21641ee73d479'
            '35bcd3281043a7f4cc6ac7ee4b8978c0a90b3a14961139fdf24622100107af98'
            '9dbd7446b7b3d1b6373939cc9ee1946be1c5ded717401518e36281c584e8eb09'
            '403a7a06966faad2ec06ff6aedf553728d24714dc8f16183afa227b3bd9dbe4a')

_fetchpkg()
{
  local _pkgdir="$srcdir/pkgs/$1" && shift
  mkdir -p "$_pkgdir"
  for _file in $@; do
    (cd "$srcdir/PKGDIR" && find $_file | cpio -pdvmu "$_pkgdir") || true
    (cd "$srcdir/PKGDIR" && find $_file -delete) || true
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
  makepkg_cflags="-Os -pipe -fno-plt"
  # TODO: riscv64
  case $CARCH in
    x86_64) makepkg_cflags+=" -march=x86-64 -fstack-clash-protection -fcf-protection" ;;
    aarch64) makepkg_cflags+=" -march=armv8-a" ;;
    riscv64) makepkg_cflags+=" -march=rv64gc" ;;
  esac
  sed -i ./makepkg.conf \
    -e "s|@@BUILD_GEN_CFLAGS@@|$makepkg_cflags|g"

  if [ "$CARCH" == "riscv64" ]; then
    # disable lto since for riscv gold is not ready
    sed -i 's/lto/!lto/' ./makepkg.conf
  fi

  cd "$pkgbase-v$pkgver"
  sed -i -e 's/EUID == 0/EUID == -1/' scripts/makepkg.sh.in
  sed -i '/bsdtar -xf .*dbfile/s|-C|--no-fflags -C|' scripts/repo-add.sh.in

  ewe-meson \
    -Dscriptlet-shell=/usr/bin/bash \
    -Dldconfig=/usr/bin/ldconfig \
    -Ddoc=disabled \
    build
  # TODO: -Ddoc=enabled -Ddoxygen=enabled
  meson compile -C build

  DESTDIR="$srcdir/PKGDIR" meson install -C build
  _fetchpkg libalpm ${FLIST_LIBALPM[@]}
  _fetchpkg pacman ${FLIST_PACMAN[@]}
  _fetchpkg makepkg ${FLIST_MAKEPKG[@]}
  _fetchpkg repo-tools ${FLIST_REPO_TOOLS[@]}
}

package_libalpm()
{
  pkgdesc="Arch Linux package management library"
  depends=(libarchive curl gettext libxml2 gpgme)
  provides=(libalpm.so)

  mv "$srcdir"/pkgs/libalpm/* "$pkgdir"
}

package_pacman()
{
  pkgdesc="A library-based package manager with dependency support"
  depends=(bash "libalpm=$pkgver" fakeroot pacman-mirrorlist)
  provides+=(makepkg)
  backup=(etc/pacman.conf etc/makepkg.conf)

  mv "$srcdir"/pkgs/pacman/* "$pkgdir"
  install -Dm644 "$srcdir/pacman.conf" "$pkgdir/etc/pacman.conf"

  install -Dm644 "$srcdir/makepkg.conf" "$pkgdir/etc/makepkg.conf"
  install -Dm644 "$srcdir/function_patch.sh" "$pkgdir/usr/share/makepkg/function_patch.sh"
  install -Dm644 "$srcdir/function_pick.sh" "$pkgdir/usr/share/makepkg/function_pick.sh"
  install -Dm644 "$srcdir/function_dinit.sh" "$pkgdir/usr/share/makepkg/function_dinit.sh"
  install -Dm644 "$srcdir/function_sysutils.sh" "$pkgdir/usr/share/makepkg/function_sysutils.sh"
  install -Dm644 "$srcdir/function_license.sh" "$pkgdir/usr/share/makepkg/function_license.sh"
  install -Dm644 "$srcdir/script_warndirs.sh" "$pkgdir/usr/share/makepkg/lint_package/warndirs.sh"
  install -Dm644 "$srcdir/script_noglibc.sh" "$pkgdir/usr/share/makepkg/lint_package/noglibc.sh"

  # TODO: poor performance
  sed -i 's/lint_package_functions/#lint_package_functions/' $pkgdir/usr/share/makepkg/lint_package/build_references.sh
}

package_repo-tools()
{
  pkgdesc="Package database maintenance utilities for pacman"
  arch=(any)
  depends=(pacman)

  mv "$srcdir"/pkgs/repo-tools/* "$pkgdir"
}
