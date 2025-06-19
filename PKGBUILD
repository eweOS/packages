# Maintainer: Eric Long <i@hack3r.moe>

pkgname=expac
pkgver=10
pkgrel=1
pkgdesc='alpm data (pacman database) extraction utility'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/falconindy/expac"
license=(MIT)
depends=(libalpm)
makedepends=(git meson perl)
source=("git+https://github.com/falconindy/expac.git#tag=$pkgver")
sha256sums=('2c09cc65f6ada044f4cc6da8735e5e0fb0f7bd0f7a2f5aab6019410891babb4b')

build() {
	ewe-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
