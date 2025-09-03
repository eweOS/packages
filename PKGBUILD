# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=okular
pkgver=25.08.0
pkgrel=1
pkgdesc='Document Viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://apps.kde.org/okular/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
#FIXME: missing phonon-qt6
depends=(discount
         djvulibre
         freetype2
         plasma-activities
         karchive
         kbookmarks
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         ki18n
         kiconthemes
         kio
         kitemviews
         kparts
         kpty
         ktextwidgets
         kwallet
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libkexiv2
         libspectre
         libtiff
         poppler-qt6
         purpose
         qt6-base
         qt6-declarative
         qt6-speech
         qt6-svg
         threadweaver
         zlib)
makedepends=(ebook-tools
             extra-cmake-modules
             kdegraphics-mobipocket
             kdoctools
             python3)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support'
            'unarchiver: Comic Book Archive support (alternative)'
            'unrar: Comic Book Archive support')
groups=(kde-applications
        kde-graphics)
source=(
  https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz
  no-x11.patch
)
sha256sums=('8c70c448e8aa8c55c3623024ee1d70930888672a503c40c60af2de702ffe64fc'
            '5f44988742376b4f989307b03e32d453b577c77c0a8622d66c3f5bde30332097')
options=(!zipman)

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  sed -i 's/HAVE_X11 TRUE/HAVE_X11 FALSE/' CMakeLists.txt
}

build() {
  # vasprintf
  CFLAGS+=" -D_GNU_SOURCE"
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DFORCE_NOT_REQUIRED_DEPENDENCIES=Phonon4Qt6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
