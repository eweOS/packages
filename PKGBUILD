# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kdenlive
pkgver=24.08.1
pkgrel=1
pkgdesc='A non-linear video editor for Linux using the MLT video framework'
arch=(x86_64 aarch64 riscv64)
url='https://apps.kde.org/kdenlive/'
license=(GPL-2.0-or-later)
depends=(frei0r-plugins
         karchive
         kbookmarks
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         kguiaddons
         ki18n
         kiconthemes
         kio
         kitemviews
         knewstuff
         knotifications
         knotifyconfig
         ktextwidgets
         kwidgetsaddons
         kxmlgui
         mlt
         purpose
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-networkauth
         qt6-svg
         solid)
makedepends=(extra-cmake-modules
             qt6-tools)
optdepends=('bigsh0t: VR360 effects'
            'dvgrab: for firewire capture'
            'ffmpeg: for FFmpeg plugin'
            'kimageformats: support for dds, xcf, exr, psd, and more image formats'
            'mediainfo: for technical clip information'
            'noise-suppression-for-voice: noise suppression effect'
            'opencv: for motion tracking'
            'opentimelineio: timeline export/import'
            'plasma-desktop: theme configuration'
            'python-openai-whisper: speech to text (Whisper engine)'
            'python-srt_equalizer: speech to text (Whisper engine)'
            'python-vosk: speech to text (VOSK engine)'
            'qt6-imageformats: support for tiff, webp, and more image formats'
            'recordmydesktop: for screen capture')
groups=(kde-applications
        kde-multimedia)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('55b42af545304ec26bf20b4e9e79e89e91d61481fbbb93a5df7c74e86fbae142')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
