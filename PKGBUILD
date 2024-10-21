# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sonnet
pkgver=6.6.0
pkgrel=2
pkgdesc='Spelling framework for Qt'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(qt6-base)
makedepends=(aspell
             extra-cmake-modules
             hunspell
             libvoikko
             qt6-declarative
             qt6-tools)
optdepends=('aspell: spell checking via aspell'
            'hspell: spell checking for Hebrew'
            'hunspell: spell checking via hunspell' 
            'libvoikko: Finnish support via Voikko'
            'qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2f8a5ef2d5264a31af686efa8fe31372837edc5317f3103395dd389c37237316')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

