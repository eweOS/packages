# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qtermwidget
pkgver=2.1.0
pkgrel=1
pkgdesc="A terminal widget for Qt, used by QTerminal"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
url="https://github.com/lxqt/qtermwidget"
# Yep, it's messy when you're talking about licenses
# https://github.com/lxqt/qtermwidget/blob/2.0.0/README.md?plain=1#L13-L42
license=('LGPL-2.0-or-later' 'BSD-3-Clause')
depends=("qt6-base")
makedepends=("git" "lxqt-build-tools")
optdepends=(
  'python: PyQt bindings'
)
source=(
  "git+https://github.com/lxqt/qtermwidget.git#tag=$pkgver"
)
sha256sums=('f757c30fda5c023bc88be4bf9628097ab8eacc87335ed9aca136eb672bca9e84')

prepare() {
  cd qtermwidget
  sed -i '1i #define _PATH_UTMP "/var/run/utmp"' lib/kpty.cpp
  sed -i '1i #define _PATH_WTMP "/var/log/wtmp"' lib/kpty.cpp
}

build() {
  cmake -B build -S qtermwidget \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/qtermwidget/README.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
