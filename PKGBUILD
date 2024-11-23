# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lximage-qt
pkgver=2.1.0
pkgrel=1
pkgdesc="The LXQt image viewer and screenshot tool"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lximage-qt/blob/2.0.1/AUTHORS#L8 also mentions LGPL-2.1+, but files are either removed [1] or re-licensed [2]
# [1] https://github.com/lxqt/lximage-qt/commit/30f3bc7bbe43d7834fe4dbee83a0c9be489ce439
# [2] https://github.com/lxqt/lximage-qt/commit/59c98f34a0aeff8443b16507caf67824652a57b5
license=("GPL-2.0-or-later")
depends=("lxqt-themes" "libfm-qt" "qt6-svg" "libexif" "libfm-qt6.so")
optdepends=(
  "qt6-imageformats: support for additional image formats (WEBP, TIFF, etc.)"
  "kimageformats: support for additional image formats (PCX, XCF, HEIF, etc.)"
)
makedepends=("lxqt-build-tools")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  no-x11.patch
)
sha256sums=('fbf600305ec3a0b725df2bdc82ae8a87c060ea5ddad0e87efa79c3c44bf7f6fc'
            'ac5845e00853c5f40f32d099c97602ce4bec21c2ee563a83b4f3f6fe8a7c69a6')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
