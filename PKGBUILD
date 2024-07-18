# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=p11-kit
pkgname=(
  p11-kit
  libp11-kit
)
pkgver=0.25.5
pkgrel=1
pkgdesc="Loads and enumerates PKCS#11 modules"
url="https://p11-glue.freedesktop.org"
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(
  libffi
  libtasn1
)
makedepends=(
  bash-completion
  meson
  docbook-xsl
)
source=(https://github.com/p11-glue/p11-kit/releases/download/$pkgver/p11-kit-$pkgver.tar.xz)
sha256sums=('04d0a86450cdb1be018f26af6699857171a188ac6d5b8c90786a60854e1198e5')

build() {
  local meson_options=(
    -D man=true
    -D systemd=disabled
    -D trust_paths=/etc/ca-certificates/trust-source:/usr/share/ca-certificates/trust-source
  )

  ewe-meson p11-kit-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_p11-kit() {
  depends=(
    "libp11-kit=$pkgver-$pkgrel"
    libp11-kit.so
  )

  meson install -C build --destdir "$pkgdir"
  ln -sf "/usr/bin/update-ca-trust" "$pkgdir/usr/lib/p11-kit/trust-extract-compat"

  _pick_ lib "$pkgdir"/usr/include
  _pick_ lib "$pkgdir"/usr/lib/{p11-kit-proxy.so,libp11-kit.*}
  _pick_ lib "$pkgdir"/usr/lib/{pkcs11,pkgconfig}
  _pick_ lib "$pkgdir"/usr/share/p11-kit

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit-$pkgver/COPYING
}

package_libp11-kit() {
  pkgdesc+=" (library)"
  provides=(libp11-kit.so)

  mv pkgs/lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 p11-kit-$pkgver/COPYING
}
