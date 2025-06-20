# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=containers-common
pkgver=0.63.1
pkgrel=1
_image_pkgver=5.34.3
_podman_pkgver=5.4.1
_shortnames_pkgver=2025.03.19
_skopeo_pkgver=1.18.0
_storage_pkgver=1.57.2
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
sha512sums=('fc513752a33b0fb5a99893bf940b8a31fd411d3c5fd7984da6e2134c4c5136b5d304d81243793bd2b6d4b16ce26e66c20a5c58c19d68e8cc165843f67cea940e'
            '33e56d7105ed4ef37e7f508b6f86cf9be625d03107f23580f6d5172e1bc1e5e1eae72b73db0597eb47cbe114bee39d575ae3493572e282c3cee1216fb78edced'
            '7cbe02c4fdfce83e8becd5c167768d25eab621794e736e7741ca8d4d1384e7db550c59b2f45356aaabd49d9d236bae65bad7f60dc2392a0903ceec812fa5d1c2'
            '7d56d78b4e0299c187eb2ea46a2d6ac41a4ad30848e9f5fe43285af74c5207f6fc4ee98c15bd5114de7a660e52846f75c26632ae1aa3ccf656b504798a6b1d56'
            'f092df52d2b8512d453ca4964304363481ef6bda3d05998654a2e3269fc9494af3a9c7c98f2a6895f6595c43733a4e9ebd39e3b62e1575a036134a8547dc3081'
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
