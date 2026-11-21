# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=nvme-cli
pkgver=3.2
pkgrel=1
pkgdesc='Nvme-express user space tooling for linux'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://nvmexpress.org/open-source-nvme-ssd-management-utility-nvme-command-line-interface-nvme-cli
license=(GPL-2.0-or-later)
depends=(json-c keyutils libarchive libkmod musl openssl python)
provides=(libnvme3.so)
makedepends=(linux-uapi-headers meson swig)
# 0001: Downstream, fix the CLI test helper build with musl
# 0002: Downstream, extract test fixtures with tarfile because bsdtar rejects
#       the self-referential hardlinks in them
# TODO: Upstream these portability fixes
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/linux-nvme/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  0001-tests-cli-support-musl.patch
  0002-tests-cli-use-tarfile.patch
)
sha256sums=('8ad36c9fe68a01e73e0dd542afdc38cc51309ed185fa9b80e4b0a8c61831a235'
            'bf5447f7d435f572e73f416ab9eb42de34f1ee6706a83c74485fe99bfcd91ce7'
            '363c1e02f83da747f8888ec1e3d43ef2518fac05b934a08a1ad13a1115db5b23')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  # eweOS does not provide systemd; keep the legacy udev autoconnect.
  ewe-meson --sysconfdir /etc build $pkgname-$pkgver \
    -Dnvme-discoverd=disabled \
    -Dmdns=disabled \
    -Dkmip=disabled \
    -Dnvmf-autoconnect=enabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir"/usr/lib/systemd
  _install_license_ $pkgname-$pkgver/LICENSE
}
