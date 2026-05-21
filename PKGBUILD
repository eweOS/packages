# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-archiver
pkgver=1.3.0
pkgrel=2
pkgdesc="A simple & lightweight desktop-agnostic Qt file archiver"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# Seems all files contain "any later"
license=("GPL-2.0-or-later")
depends=('libfm-qt' 'qt6-base' 'glib2' 'json-glib' 'libfm-qt6.so')
makedepends=('cmake' 'qt6-tools' 'lxqt-build-tools')
optdepends=(
  'libarchive: for handling rpm files'
  'p7zip: 7Z support'
)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('948655705e8e6a9c4c57f2d09b1134b4b23739c8cac0c39b09b04fb15d5375ef')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib

  make -C build
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}
