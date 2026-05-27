# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.3.0
pkgrel=1
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots0.20)
makedepends=(libxkbcommon meson pixman wayland-protocols git linux-headers
	     wlroots0.20-devel)
source=("git+https://github.com/cage-kiosk/cage.git#tag=v$pkgver")
sha512sums=('0925e1605ea9afcb3f005d36b2438ddcba67c6966df402a57bb606a6c26269d070887ad742b75e0308ca15091ea9ba22224e3d5f2810bc0ccdbde3432d05cdb7')

build() {
  ewe-meson -Dman-pages=disabled build "$pkgname"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 "$pkgname/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "$pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
