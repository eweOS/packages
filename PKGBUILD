# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=nvme-cli
pkgver=2.16
pkgrel=1
pkgdesc='Nvme-express user space tooling for linux'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://nvmexpress.org/open-source-nvme-ssd-management-utility-nvme-command-line-interface-nvme-cli
license=(GPL-2.0-or-later)
depends=(json-c libnvme musl)
makedepends=(linux-uapi-headers meson)
source=($pkgname-$pkgver.tar.gz::https://github.com/linux-nvme/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(989682ed7b250a2c7a8127e362ffc5d29f5c370127abe405be09c73216da2b97)

build() {
  ewe-meson --sysconfdir /etc build $pkgname-$pkgver
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir"/usr/lib/systemd
  _install_license_ $pkgname-$pkgver/LICENSE
}
