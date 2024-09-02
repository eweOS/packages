# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpc
pkgver=0.35
pkgrel=1
pkgdesc="Minimalist command line interface to MPD"
arch=(x86_64 aarch64 riscv64)
url="https://www.musicpd.org/clients/mpc/"
license=(GPL-2.0-or-later)
makedepends=(
  libmpdclient
  meson
  rsync
)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('be7ec268432eb8e34092d025e6a40379e83d54e5f87943beeb87ed8fe9db4c5c8261b09cc3230ada28300151382f97b1c2da45f54e8aad68af9946f484d0b28b')

build() {
  ewe-meson build "$pkgname-$pkgver" -D documentation=disabled
  meson compile -C build
}

package() {
  depends+=(
    libmpdclient libmpdclient.so
  )

  meson install -C build --destdir "$pkgdir"
  install -vDm 644 "$pkgname-$pkgver/contrib/mpc-completion.bash" "$pkgdir/usr/share/bash-completion/completions/mpc"
}

