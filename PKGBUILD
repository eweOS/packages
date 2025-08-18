# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=containers-common
pkgver=0.64.1
pkgrel=1
_image_pkgver=5.36.0
_podman_pkgver=5.6.0
_shortnames_pkgver=2025.03.19
_skopeo_pkgver=1.20.0
_storage_pkgver=1.59.0
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
source=(
  common-$pkgver.tar.gz::https://github.com/containers/common/archive/v$pkgver.tar.gz
  image-$_image_pkgver.tar.gz::https://github.com/containers/image/archive/v$_image_pkgver.tar.gz
  podman-$_podman_pkgver.tar.gz::https://github.com/containers/podman/archive/v$_podman_pkgver.tar.gz
  skopeo-$_skopeo_pkgver.tar.gz::https://github.com/containers/skopeo/archive/v$_skopeo_pkgver.tar.gz
  storage-$_storage_pkgver.tar.gz::https://github.com/containers/storage/archive/v$_storage_pkgver.tar.gz
  shortnames-$_shortnames_pkgver.tar.gz::https://github.com/containers/shortnames/archive/refs/tags/v$_shortnames_pkgver.tar.gz
  mounts.conf
  tmpfiles.conf
  $pkgname-0.48.0-init_path.patch
)
sha512sums=('734add4dced16c2d70e2d290ee2a053c0c77031454aa448b38a91070843acc2748fd99fefd093815744e78a8282b9f8e261b16702c27a9b1d341849e7a7b13f9'
            'e13035189097dd19029e93b7c1433d8ea3166624dc38826d94b613754d4a30060d445c122f57286e1e1027322f1389eec4f832f75b80478ced6034cc35701116'
            '683f729ae02da1e95ed2a17d09e70f53e4218fd36c362970324d533d07ba250dfdb193c79f66a266b0250c27d8ef3bf6987f3264c721d2dfc74b81d91854ebb3'
            '5932ae68c01aad3ebc538dbe6c7f712604704b408da46b1731ae7352132dbc63082e78febae808a9bbabff206ebd09ee390cd0bb0700141c3b76e1f75e525439'
            'e370c697d39414b182ea9c3c1b907a93b8e1c03245ed4078a98af8bc0ad1c22deae422c140dcbfba631b633fe8e4e6fa1e04011bb5cb2af997ac7392c337ec8a'
            'edadadda8920ac4880f2c44f396e5d4c844bf15c964d7ef5d14c68637ac43e0df91f4efd2be747bca74bd0da959ea21cc3200ab14b2b57aba5975cff8f2fbefa'
            '2855fdd4842206a4b0d9006d2c55389c3618323d379fd22ac52806b33086943ffe484dcb3a24111b93caf37bf025365617eb85c5d0b852ec27a51eceea2376a3'
            '0551af4c412175409fa0f9cdb4bdbc370868ac553cbfb871e23d4c199e016b1cafe355b86fa1f1a1df5c8d3426f681234b80efc96855567adf916b70793120cd'
            '01da77bb4c4ec7089e56c8b5d33a5c452844d690b11a0a18d6cc179f2c69af87d91bcfa30a7b6967808feca6ead967ca67d9bf0ae3ee7d728e57799388bbfe69')

prepare() {
  sed -r 's/(GOMD2MAN = ).*/\1 go-md2man/' -i storage-$_storage_pkgver/docs/Makefile
  patch -Np1 -d common-$pkgver -i ../$pkgname-0.48.0-init_path.patch
  mkdir -vp build/{man1,man5}
}

build() {

  (
    printf "Creating common man pages...\n"
    cd common-$pkgver
    for _man_page in docs/*.md pkg/hooks/docs/*.md; do
      go-md2man -in $_man_page -out ../build/man5/$(basename ${_man_page//.md})
    done
  )

  (
    printf "Creating image man pages...\n"
    cd image-$_image_pkgver
    mkdir -vp man5
    mv -v docs/*.5.md man5/
    for _man_page in docs/*.md; do
      go-md2man -in $_man_page -out ../build/man1/$(basename ${_man_page//.md}).1
    done
    for _man_page in man5/*.md; do
      go-md2man -in $_man_page -out ../build/man5/$(basename ${_man_page//.md})
    done
  )

  (
    printf "Creating storage documentation...\n"
    cd storage-$_storage_pkgver
    make -C docs
  )
}

check() {
  local _podman_common_ver
  _podman_common_ver="$(rg "github.com/containers/common" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"
  _podman_image_ver="$(rg "github.com/containers/image" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"
  _podman_storage_ver="$(rg "github.com/containers/storage" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"

  printf "Common version in podman: %s\n" $_podman_common_ver
  printf "Image version in podman: %s\n" $_podman_image_ver
  printf "Storage version in podman: %s\n" $_podman_storage_ver

  # NOTE: we are comparing the major.minor version of containers/common required by podman with the one of containers/common that we are trying to build
  # https://github.com/containers/common/issues/923
  if (( $(vercmp "${_podman_common_ver%.*}" "${pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/common in version %s but we are trying to build version %s\n" $_podman_pkgver ${_podman_common_ver%.*} ${pkgver%.*}
    exit 1
  fi
  if (( $(vercmp "${_podman_image_ver%.*}" "${_image_pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/image in version %s but we are trying to use version %s\n" $_podman_pkgver ${_podman_image_ver%.*} ${_image_pkgver%.*}
    exit 1
  fi
  if (( $(vercmp "${_podman_storage_ver%.*}" "${_storage_pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/storage in version %s but we are trying to use version %s\n" $_podman_pkgver ${_podman_storage_ver%.*} ${_storage_pkgver%.*}
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
    cd common-$pkgver
    # configs
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/usr/share/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/usr/share/containers/"
  )
  (
    cd image-$_image_pkgver
    # configs
    install -vDm 644 registries.conf -t "$pkgdir/etc/containers/"
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
  (
    cd storage-$_storage_pkgver
    # configs
    install -vDm 644 storage.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 storage.conf -t "$pkgdir/usr/share/containers/"
    # man pages
    install -vDm 644 docs/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -vDm 644 docs/*.5 -t "$pkgdir/usr/share/man/man5/"
  )
  # man pages
  install -vDm 644 build/man1/*.1 "$pkgdir/usr/share/man/man1/"
  install -vDm 644 build/man5/*.5 "$pkgdir/usr/share/man/man5/"
}
