# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kio
pkgver=6.20.0
pkgrel=3
pkgdesc='Resource and network access abstraction'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
makedepends=(extra-cmake-modules qt6-tools linux-headers kdoctools qt6-base-devel)
optdepends=('kded: proxy management and cookie storage'
            'kdoctools: for the help kioslave'
            'kio-extras: extra protocols support (sftp, fish and more)'
            'kio-fuse: to mount remote filesystems via FUSE'
            'switcheroo-control: hybrid GPU support')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('7e67d471fc10b7df3d76e6ce859480be5d6e675d316592e7a8419b97f01bd649')

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
