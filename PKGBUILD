# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Long <i@hack3r.moe>

pkgbase=pacman
pkgname=(libalpm pacman repo-tools)
pkgver=6.0.2
pkgrel=19
arch=(x86_64 aarch64 riscv64)
url=https://www.archlinux.org/pacman/
license=(GPL)
makedepends=(meson libarchive openssl ninja acl curl xz gpgme)  # TODO: asciidoc doxygen
checkdepends=(python)
source=(
  https://sources.archlinux.org/other/$pkgbase/$pkgbase-$pkgver.tar.xz
  pacman.conf
  makepkg.conf
  function_patch.sh
  function_dinit.sh
  function_pick.sh
  function_sysutils.sh
  function_license.sh
  script_warndirs.sh
)
sha256sums=('7d8e3e8c5121aec0965df71f59bedf46052c6cf14f96365c4411ec3de0a4c1a5'
            '45735476a908373bcf8392cf3b4fb88bd4b4914d10b76f35542e7a679ad01229'
            '4d7758227d57714a34c04b82e816efd609f0feff91bca6c3505d7ee0c6d9a26f'
            '6338de233368bfa76ee17353785709e282ace072eae6996c1289f0fb5b84ffc4'
            'd99d4fe5e414cb4748f4e9b20637d9fd69ec8c392e3f862edbc69b6564a52876'
            '7d2ad28bef8f9f77f33929d2050244a6f29941de6ad0793b6820caee3dbd84e3'
            '5648db8988c73588c05eccaa4329f6d3bd95ec1e39f2337eb1f21641ee73d479'
            '35bcd3281043a7f4cc6ac7ee4b8978c0a90b3a14961139fdf24622100107af98'
            '855d0730810fcb63fa10dcc66d5599200079673643bee5adaf750cbaddfa423a')

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
  # TODO: riscv64
  case $CARCH in
    x86_64) makepkg_cflags="-march=x86-64 -Os -pipe -fno-plt -fstack-clash-protection -fcf-protection" ;;
    aarch64) makepkg_cflags="-march=armv8-a -Os -pipe -fno-plt" ;;
    riscv64) makepkg_cflags="-march=rv64gc -Os -pipe -fno-plt" ;;
  esac
  sed -i ./makepkg.conf \
    -e "s|@@BUILD_GEN_CFLAGS@@|$makepkg_cflags|g"

  if [ "$CARCH" == "riscv64" ]; then
    # disable lto since for riscv gold is not ready
    sed -i 's/lto/!lto/' ./makepkg.conf
  fi

  cd "$pkgbase-$pkgver"
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
  depends=(bash "libalpm=$pkgver" fakeroot)
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
}

package_repo-tools()
{
  pkgdesc="Package database maintenance utilities for pacman"
  arch=(any)
  depends=(pacman)

  mv "$srcdir"/pkgs/repo-tools/* "$pkgdir"
}
