# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ffmpeg
pkgver=7.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=(x86_64 aarch64 riscv64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
  freetype2
  fribidi
  gmp
  libdrm
  libpulse
  mesa
  libopus
  libsrt
  libvorbis
  sdl2
  libx264
  libx265
  xz
  zlib
  libva
  libass
  librsvg
  zimg
  libwebp
  libvpx
  soxr
  fontconfig
  openssl
)
makedepends=(
  clang
  git
  mesa
  linux-headers
  nasm
)
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
)
source=(https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n$pkgver.tar.gz)
sha256sums=('7ddad2d992bd250a6c56053c26029f7e728bebf0f37f80cf3f8a0e6ec706431a')

prepare() {
  _patch_ FFmpeg-n$pkgver
  cd FFmpeg-n$pkgver
  sed -i 's@cc_default="gcc"@cc_default="clang"@g' ./configure
  sed -i 's@cxx_default="g++"@cxx_default="clang++"@g' ./configure
  sed -i 's@host_cc_default="gcc"@host_cc_default="clang"@g' ./configure
}

build() {
  cd FFmpeg-n$pkgver
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --disable-amf \
    --disable-avisynth \
    --disable-cuda-llvm \
    --enable-fontconfig \
    --enable-gmp \
    --disable-gnutls \
    --enable-openssl \
    --enable-gpl \
    --disable-ladspa \
    --disable-libaom \
    --enable-libass \
    --disable-libbluray \
    --disable-libbs2b \
    --disable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --disable-libgsm \
    --disable-libiec61883 \
    --disable-libjack \
    --disable-libjxl \
    --disable-libmfx \
    --disable-libmodplug \
    --disable-libmp3lame \
    --disable-libopencore_amrnb \
    --disable-libopencore_amrwb \
    --disable-libopenjpeg \
    --disable-libopenmpt \
    --enable-libopus \
    --enable-libpulse \
    --disable-librav1e \
    --enable-librsvg \
    --enable-libsoxr \
    --disable-libspeex \
    --enable-libsrt \
    --disable-libssh \
    --disable-libsvtav1 \
    --disable-libtheora \
    --disable-libv4l2 \
    --disable-libvidstab \
    --disable-libvmaf \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --disable-libxcb \
    --enable-libxml2 \
    --disable-libxvid \
    --enable-libzimg \
    --disable-nvdec \
    --disable-nvenc \
    --disable-opencl \
    --disable-opengl \
    --enable-shared \
    --enable-vaapi \
    --enable-version3 \
    --disable-vulkan
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C FFmpeg-n$pkgver install install-man
  install -Dm 755 FFmpeg-n$pkgver/tools/qt-faststart "${pkgdir}"/usr/bin/
}
