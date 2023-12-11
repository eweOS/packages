# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Long <i@hack3r.moe>

pkgbase=pacman
pkgname=(libalpm pacman makepkg repo-tools)
pkgver=6.0.2
pkgrel=9
arch=(x86_64 aarch64 riscv64)
url=https://www.archlinux.org/pacman/
license=(GPL)
makedepends=(meson libarchive openssl ninja acl curl xz)  # TODO: asciidoc doxygen
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
            '66e0fb85053d77365997837050762089dd0248fe2fadeb4236479b6268daa202'
            'b3351f902bbbf83a4d18544340d63b7a71d58c8e40fa7ba87254f9c6c1307897'
            'd99d4fe5e414cb4748f4e9b20637d9fd69ec8c392e3f862edbc69b6564a52876'
            '7d2ad28bef8f9f77f33929d2050244a6f29941de6ad0793b6820caee3dbd84e3'
            '5648db8988c73588c05eccaa4329f6d3bd95ec1e39f2337eb1f21641ee73d479'
            '35bcd3281043a7f4cc6ac7ee4b8978c0a90b3a14961139fdf24622100107af98'
            '775595e15aafd6199eca688b0c59ddf04162c5eccb4f6f9afa4d1925d6114d86')

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
  # TODO: riscv64
  case $CARCH in
    x86_64) makepkg_cflags="-Os -pipe -fno-plt -fstack-clash-protection -fcf-protection" ;;
    aarch64) makepkg_cflags="-march=armv8-a -Os -pipe -fno-plt" ;;
    riscv64) makepkg_cflags="" ;;
  esac
  sed -i ./makepkg.conf \
    -e "s|@@BUILD_GEN_CFLAGS@@|$makepkg_cflags|g"

  cd "$pkgbase-$pkgver"
  sed -i -e 's/EUID == 0/EUID == -1/' scripts/makepkg.sh.in
  sed -i '/bsdtar -xf .*dbfile/s|-C|--no-fflags -C|' scripts/repo-add.sh.in

  meson --prefix=/usr \
        --buildtype=plain \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build  # TODO: -Ddoc=enabled -Ddoxygen=enabled
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
  depends=(libarchive curl gettext libxml2)
  provides=(libalpm.so)

  mv "$srcdir"/pkgs/libalpm/* "$pkgdir"
}

package_pacman()
{
  pkgdesc="A library-based package manager with dependency support"
  depends=(bash "libalpm=$pkgver")
  backup=(etc/pacman.conf)

  mv "$srcdir"/pkgs/pacman/* "$pkgdir"
  install -Dm644 "$srcdir/pacman.conf" "$pkgdir/etc/pacman.conf"
}

package_makepkg()
{
  pkgdesc="A script to automate the building of pacman packages"
  arch=(any)
  depends=("pacman=$pkgver" fakeroot)
  groups=(base-devel)
  backup=(etc/makepkg.conf)

  mv "$srcdir"/pkgs/makepkg/* "$pkgdir"
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
