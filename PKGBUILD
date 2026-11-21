# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=venus-protocol
pkgver=1.1.3
pkgrel=1
pkgdesc="Vulkan protocol for Virtio-GPU (Venus)"
url="https://gitlab.freedesktop.org/virgl/venus-protocol"
arch=(any)
license=(MIT)
makedepends=(
  git
  meson
  python-mako
  vulkan-headers
)
# 0001: Downstream, initialize generated reply values before size calculation
# clang 21 reports -Wuninitialized-const-pointer and upstream enables -Werror
# TODO: Upstream this initialization.
source=(
  "git+$url.git#tag=v$pkgver"
  0001-initialize-reply-values-for-size-calculation.patch
)
sha256sums=('04c974767429b93fc79050d177b81a309b9e3c7b0fc67651ca6c9d780aa47d9e'
            '6ee46b176bcbdf8f4f3821ef5aa619ea34c5e2f7049b4b83ea864377254f2b22')

prepare() {
  cd "$pkgname"

  # Add the license file missing from the v1.1.3 tag.
  git cherry-pick -n 02c03c815fd07f2237d7f1161bbafcf6a829373c
  _patch_ "$pkgname"
}

build() {
  ewe-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  _install_license_ "$pkgname/LICENSE" LICENSE
}
