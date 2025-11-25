# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=containers-common
_upstream=container-libs
pkgver=0.66.0
pkgrel=1
_podman_pkgver=5.7.0
_shortnames_pkgver=2025.03.19
_skopeo_pkgver=1.20.0
pkgdesc="Configuration files and manpages for containers"
arch=(any)
url="https://github.com/containers"
license=(Apache-2.0)
depends=('container-network-stack>1')
makedepends=(go-md2man)
checkdepends=(ripgrep)
backup=(
  etc/containers/containers.conf
  etc/containers/mounts.conf
  etc/containers/policy.json
  etc/containers/registries.conf
  etc/containers/seccomp.json
  etc/containers/storage.conf
)
# configuration override directories need to exist
options=(emptydirs)
_src_dir="$_upstream-common-v$pkgver"
source=(
  $_src_dir.tar.gz::https://github.com/containers/container-libs/archive/refs/tags/common/v$pkgver.tar.gz
  podman-$_podman_pkgver.tar.gz::https://github.com/containers/podman/archive/v$_podman_pkgver.tar.gz
  skopeo-$_skopeo_pkgver.tar.gz::https://github.com/containers/skopeo/archive/v$_skopeo_pkgver.tar.gz
  shortnames-$_shortnames_pkgver.tar.gz::https://github.com/containers/shortnames/archive/refs/tags/v$_shortnames_pkgver.tar.gz
  mounts.conf
  tmpfiles.conf
  $pkgname-0.48.0-init_path.patch
)
sha512sums=('3bd047c9869e287a5a424252cfd3945c614b0fca1b933b88d47debd04fbbd582b4d3e3f14e228f82d4b4397046eb45a6fb3ed116ee7500f21f1c04ab7a82dce4'
            'e53e3f6d441de7865733e085017ce1c3e0af5cb0ad0cf605f5d15e9813d38e1af22691d59498960ed7bd18e32ef003db4c151a4f4bd5bd0dbac69f4011851ff1'
            '5932ae68c01aad3ebc538dbe6c7f712604704b408da46b1731ae7352132dbc63082e78febae808a9bbabff206ebd09ee390cd0bb0700141c3b76e1f75e525439'
            'edadadda8920ac4880f2c44f396e5d4c844bf15c964d7ef5d14c68637ac43e0df91f4efd2be747bca74bd0da959ea21cc3200ab14b2b57aba5975cff8f2fbefa'
            '2855fdd4842206a4b0d9006d2c55389c3618323d379fd22ac52806b33086943ffe484dcb3a24111b93caf37bf025365617eb85c5d0b852ec27a51eceea2376a3'
            '0551af4c412175409fa0f9cdb4bdbc370868ac553cbfb871e23d4c199e016b1cafe355b86fa1f1a1df5c8d3426f681234b80efc96855567adf916b70793120cd'
            '01da77bb4c4ec7089e56c8b5d33a5c452844d690b11a0a18d6cc179f2c69af87d91bcfa30a7b6967808feca6ead967ca67d9bf0ae3ee7d728e57799388bbfe69')

prepare() {
  sed -r 's/(GOMD2MAN = ).*/\1 go-md2man/' -i $_src_dir/storage/docs/Makefile
  patch -Np1 -d $_src_dir/common -i ../../$pkgname-0.48.0-init_path.patch
  mkdir -vp build/{man1,man5}
}

build() {
  (
    printf "Creating common man pages...\n"
    cd $_src_dir/common
    for _man_page in docs/*.md pkg/hooks/docs/*.md; do
      go-md2man -in "$_man_page" -out ../../build/man5/"$(basename "${_man_page//.md}")"
    done
  )

  (
    printf "Creating image man pages...\n"
    cd $_src_dir/image
    mkdir -vp man5
    mv -v docs/*.5.md man5/
    for _man_page in docs/*.md; do
      go-md2man -in "$_man_page" -out ../../build/man1/"$(basename "${_man_page//.md}")".1
    done
    for _man_page in man5/*.md; do
      go-md2man -in "$_man_page" -out ../../build/man5/"$(basename "${_man_page//.md}")"
    done
  )

  (
    printf "Creating storage documentation...\n"
    make -C $_src_dir/storage/docs
  )
}

check() {
  local _podman_common_ver
  _podman_common_ver="$(rg "go.podman.io/common" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"

  printf "Common version in podman: %s\n" "$_podman_common_ver"

  # NOTE: we are comparing the major.minor version of containers/common required by podman with the one of containers/common that we are trying to build
  # https://github.com/containers/common/issues/923
  if (( $(vercmp "${_podman_common_ver%.*}" "${pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires container-libs/common in version %s but we are trying to build version %s\n" "$_podman_pkgver" "${_podman_common_ver%.*}" "${pkgver%.*}"
    exit 1
  fi
}

package() {
  # directories
  install -vdm 755 "$pkgdir/etc/containers/containers.conf.d/"
  install -vdm 755 "$pkgdir/etc/containers/oci/hooks.d/"
  install -vdm 755 "$pkgdir/etc/containers/registries.conf.d/"
  install -vdm 755 "$pkgdir/usr/share/containers/oci/hooks.d/"
  install -vDm 644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # configs
  install -vDm 644 mounts.conf -t "$pkgdir/etc/containers/"

  (
    cd $_src_dir/common
    # configs
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/usr/share/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/usr/share/containers/"
  )
  (
    cd $_src_dir/image
    # configs
    install -vDm 644 registries.conf -t "$pkgdir/etc/containers/"
  )
  (
    cd $_src_dir/storage
    # configs
    install -vDm 644 storage.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 storage.conf -t "$pkgdir/usr/share/containers/"
    # man pages
    install -vDm 644 docs/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -vDm 644 docs/*.5 -t "$pkgdir/usr/share/man/man5/"
  )
  (
    cd shortnames-$_shortnames_pkgver
    install -vDm 644 shortnames.conf "$pkgdir/etc/containers/registries.conf.d/00-shortnames.conf"
  )
  (
    cd skopeo-$_skopeo_pkgver
    # configs
    install -vDm 644 default-policy.json "$pkgdir/etc/containers/policy.json"
    install -vDm 644 default.yaml -t "$pkgdir/etc/containers/registries.d/"
  )
  # man pages
  install -vDm 644 build/man1/*.1 "$pkgdir/usr/share/man/man1/"
  install -vDm 644 build/man5/*.5 "$pkgdir/usr/share/man/man5/"
}
