# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ffmpeg
pkgver=7.1.1
pkgrel=6
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
  aom
  dav1d
  fontconfig
  freetype2
  fribidi
  gmp
  gsm
  libass
  libdrm
  libopus
  libpulse
  libsrt
  libva
  libvorbis
  libx264
  libx265
  libxml2
  librsvg
  libwebp
  libvpx
  mesa
  openssl
  rav1e
  sdl2
  soxr
  svt-av1
  vulkan-icd-loader
  xz
  zimg
  zlib
)
makedepends=(
  clang
  git
  mesa
  linux-headers
  vulkan-headers
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
# 0001: Backport, fix compatibility with svt-av1a 3.0.1
source=("https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n$pkgver.tar.gz"
	"0001-avcodec-libsvtav1-unbreak-build-with-latest.patch::https://github.com/FFmpeg/FFmpeg/commit/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95.patch")
sha256sums=('f117507dc501f2a6c11f9241d8d0c3213846cfad91764361af37befd6b6c523d'
            '50af862d25bbeddd0d2e3eff7ebe25899651ee24cc23ed6f785180b5523d246e')

prepare() {
  _patch_ FFmpeg-n$pkgver
  cd FFmpeg-n$pkgver
  sed -i 's@cc_default="gcc"@cc_default="clang"@g' ./configure
  sed -i 's@cxx_default="g++"@cxx_default="clang++"@g' ./configure
  sed -i 's@host_cc_default="gcc"@host_cc_default="clang"@g' ./configure

  if [ "$CARCH" == "riscv64" ]; then
    sed -i '1i #include <asm/unistd.h>' libavutil/riscv/cpu.c
  fi
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
    --enable-libaom \
    --enable-libass \
    --disable-libbluray \
    --disable-libbs2b \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
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
    --enable-librav1e \
    --enable-librsvg \
    --enable-libsoxr \
    --disable-libspeex \
    --enable-libsrt \
    --disable-libssh \
    --enable-libsvtav1 \
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
    --enable-vulkan
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C FFmpeg-n$pkgver install install-man
  install -Dm 755 FFmpeg-n$pkgver/tools/qt-faststart "${pkgdir}"/usr/bin/
}
