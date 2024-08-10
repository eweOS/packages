# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ffmpeg
pkgver=7.0.2
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
#_tag=3949db4d261748a9f34358a388ee255ad1a7f0c0
#source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag})
source=(https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n$pkgver.tar.gz fix-musl.patch)
sha256sums=('5eb46d18d664a0ccadf7b0adee03bd3b7fa72893d667f36c69e202a807e6d533'
            '2b3cafee6a58afcf768a90acdbd993e3f30728acc39aa72a26981ab6bb774a79')

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
