# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-archiver
pkgver=1.1.0
pkgrel=1
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
sha256sums=('691a00b70c159c6188e1af3e545982d100b8c24fd6db5376348f5c5c086b26c7')

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
