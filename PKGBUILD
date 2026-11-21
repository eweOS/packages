# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=nvme-cli
pkgver=3.2
pkgrel=1
pkgdesc='Nvme-express user space tooling for linux'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://nvmexpress.org/open-source-nvme-ssd-management-utility-nvme-command-line-interface-nvme-cli
license=(GPL-2.0-or-later)
depends=(json-c libnvme musl)
makedepends=(linux-uapi-headers meson)
source=($pkgname-$pkgver.tar.gz::https://github.com/linux-nvme/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8ad36c9fe68a01e73e0dd542afdc38cc51309ed185fa9b80e4b0a8c61831a235')

build() {
  ewe-meson --sysconfdir /etc build $pkgname-$pkgver
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir"/usr/lib/systemd
  _install_license_ $pkgname-$pkgver/LICENSE
}
