# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpv
pkgver=0.41.0
pkgrel=4
pkgdesc='a free, open source, and cross-platform media player'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later')
url='https://mpv.io/'
depends=(
  'alsa-lib' 'wayland' 'zlib' 'ffmpeg' 'libass' 'lcms2' 'libarchive'
  'sdl2' 'zimg' 'zlib' 'alsa-lib' 'pipewire' 'libpulse' 'libplacebo'
  'libdrm' 'libjpeg' 'libxkbcommon' 'libdisplay-info' 'libsixel'
  'mesa' 'libglvnd' 'libva' 'vulkan-icd-loader')
makedepends=('git' 'meson' 'wayland-protocols' 'linux-headers' 'vulkan-headers')
checkdepends=('weston')
source=("https://github.com/mpv-player/mpv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee21092a5ee427353392360929dc64645c54479aefdb5babc5cfbb5fad626209')

build() {
  local _audioout_features=(
    -D aaudio=disabled
    -D audiotrack=disabled
    -D audiounit=disabled
    -D coreaudio=disabled
    -D avfoundation=disabled
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
    -D egl-x11=disabled
    -D gl-cocoa=disabled
    -D gl-dxinterop=disabled
    -D gl-win32=disabled
    -D gl-x11=disabled
    -D sdl2-video=disabled
    -D shaderc=disabled
    -D spirv-cross=disabled
    -D vdpau=disabled
    -D vdpau-gl-x11=disabled
    -D vaapi-win32=disabled
    -D vaapi-x11=disabled
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
    -D videotoolbox-gl=disabled
    -D videotoolbox-pl=disabled
  )
  local _macos_features=(
    -D macos-10-15-4-features=disabled
    -D macos-11-features=disabled
    -D macos-11-3-features=disabled
    -D macos-12-features=disabled
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
    -D libbluray=disabled
    -D pthread-debug=disabled
    -D rubberband=disabled
    -D sdl2-gamepad=disabled
    -D uchardet=disabled
    -D uwp=disabled
    -D vapoursynth=disabled
    -D vector=disabled
    -D win32-threads=disabled
    -D x11-clipboard=disabled
  )
  local _features=(
    -D lua=disabled
    -D libmpv=true
    -D manpage-build=disabled
    -D tests=true
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
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  weston --backend=headless-backend.so \
    --socket="$WAYLAND_DISPLAY" \
    --idle-time=0 &
  _w=$!
  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # delete private entries only required for static linking
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}"/usr/lib/pkgconfig/mpv.pc
}
