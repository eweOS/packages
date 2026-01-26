# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gamemode
pkgver=1.8.2
pkgrel=1
pkgdesc='A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/FeralInteractive/gamemode
license=(BSD-3-Clause)
depends=(
  bash
  llvm-libs
  musl
  dbus
  libinih
)
makedepends=(
  git
  meson
  linux-headers
)
checkdepends=(appstream)
provides=(
  libgamemode.so
  libgamemodeauto.so
)
_tag=c54d6d4243b0dd0afcb49f2c9836d432da171a2b
source=(git+https://github.com/FeralInteractive/gamemode.git#tag=${_tag})
sha256sums=('SKIP')

pkgver() {
  cd gamemode
  git describe --tags
}

build() {
  ewe-meson gamemode build \
    --libexecdir /usr/lib/gamemode \
    -Dwith-examples=false \
    -Dwith-sd-bus-provider=no-daemon \
    -Dwith-systemd-user-unit=false
    
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 gamemode/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/gamemode/
}
