# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpv
pkgver=0.36.0
pkgrel=1
pkgdesc='a free, open source, and cross-platform media player'
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL3')
url='https://mpv.io/'
depends=(
  'alsa-lib' 'wayland' 'zlib' 'ffmpeg' 'libass' 'lcms2' 'libarchive'
  'sdl2' 'zimg' 'zlib' 'alsa-lib' 'pipewire' 'libpulse'
  'libdrm' 'libjpeg' 'libxkbcommon'
  'mesa' 'libglvnd') 
makedepends=('git' 'meson' 'wayland-protocols')
source=("https://github.com/mpv-player/mpv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29abc44f8ebee013bb2f9fe14d80b30db19b534c679056e4851ceadf5a5e8bf6')

build() {
  local _audioout_features=(
    -D audiounit=disabled
    -D coreaudio=disabled
    -D jack=disabled
    -D openal=disabled
    -D opensles=disabled
    -D oss-audio=disabled
    -D sdl2-audio=disabled
    -D sndio=disabled
    -D wasapi=disabled  
  )
  local _videoout_features=(
    -D caca=disabled
    -D cocoa=disabled
    -D d3d11=disabled
    -D direct3d=disabled
    -D egl-android=disabled
    -D egl-angle=disabled
    -D egl-angle-lib=disabled
    -D egl-angle-win32=disabled
    -D egl-drm=disabled
    -D egl-x11=disabled
    -D gbm=disabled
    -D gl-cocoa=disabled
    -D gl-dxinterop=disabled
    -D gl-win32=disabled
    -D gl-x11=disabled
    -D libplacebo=disabled
    -D libplacebo-next=disabled
    -D rpi=disabled
    -D sdl2-video=disabled
    -D shaderc=disabled
    -D sixel=disabled
    -D spirv-cross=disabled
    -D vdpau=disabled
    -D vdpau-gl-x11=disabled
    -D vaapi=disabled
    -D vaapi-drm=disabled
    -D vaapi-wayland=disabled
    -D vaapi-x11=disabled
    -D vaapi-x-egl=disabled
    -D vulkan=disabled
    -D x11=disabled
    -D xv=disabled  
  )
  local _hwaccel_features=(
    -D android-media-ndk=disabled
    -D cuda-hwaccel=disabled
    -D cuda-interop=disabled
    -D d3d-hwaccel=disabled
    -D d3d9-hwaccel=disabled
    -D gl-dxinterop-d3d9=disabled
    -D ios-gl=disabled
    -D rpi-mmal=disabled
    -D videotoolbox-gl=disabled
    -D vulkan-interop=disabled  
  )
  local _macos_features=(
    -D macos-10-11-features=disabled
    -D macos-10-12-2-features=disabled
    -D macos-10-14-features=disabled
    -D macos-cocoa-cb=disabled
    -D macos-media-player=disabled
    -D macos-touchbar=disabled
    -D swift-build=disabled
    -D swift-flags=disabled
  )
  local _misc_features=(
    -D cdda=disabled
    -D cplugins=disabled
    -D dvbin=disabled
    -D dvdnav=disabled
    -D javascript=disabled
    -D libavdevice=disabled
    -D libbluray=disabled
    -D pthread-debug=disabled
    -D rubberband=disabled
    -D sdl2-gamepad=disabled
    -D stdatomic=disabled
    -D uchardet=disabled
    -D uwp=disabled
    -D vapoursynth=disabled
    -D vector=disabled
    -D win32-internal-pthreads=disabled
  )
  local _features=(
    -D lua=disabled
    -D libmpv=true
    -D manpage-build=disabled
  )
  ewe-meson $pkgname-$pkgver build \
    "${_audioout_features[@]}" \
    "${_videoout_features[@]}" \
    "${_hwaccel_features[@]}" \
    "${_macos_features[@]}" \
    "${_misc_features[@]}" \
    "${_features[@]}"
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # delete private entries only required for static linking 
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}"/usr/lib/pkgconfig/mpv.pc
}
