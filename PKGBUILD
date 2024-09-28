# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kio
pkgver=6.6.0
pkgrel=1
pkgdesc='Resource and network access abstraction'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(acl
         karchive
         kauth
         kbookmarks
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kguiaddons
         ki18n
         kiconthemes
         kitemviews
         kjobwidgets
         kservice
         kwallet
         kwidgetsaddons
         kwindowsystem
         libxml2
         libxslt
         qt6-5compat
         qt6-base
         solid
         util-linux-libs)
makedepends=(extra-cmake-modules qt6-tools linux-headers)
optdepends=('kded: proxy management and cookie storage'
            'kdoctools: for the help kioslave'
            'kio-extras: extra protocols support (sftp, fish and more)'
            'kio-fuse: to mount remote filesystems via FUSE'
            'switcheroo-control: hybrid GPU support')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('977f9f076eaf249ecdd961724334326c3f3a1e7d8cfcc6ca1370f390c76a2766')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
