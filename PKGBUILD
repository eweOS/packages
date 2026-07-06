# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ffmpeg
pkgver=8.1.1
pkgrel=2
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://ffmpeg.org/
license=(GPL-3.0-or-later)
depends=(
  alsa-lib
  aom
  dav1d
  fontconfig
  freetype2
  fribidi
  gmp
  gsm
  lame
  libass
  libdrm
  libjxl
  libopus
  libpulse
  libsrt
  libtheora
  libva
  libvorbis
  libx264
  libx265
  libxml2
  librsvg
  libwebp
  libvpx
  mesa
  openjpeg2
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
source=("https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n$pkgver.tar.gz")
sha256sums=('918929faccab2700c9cc7be2531c0b74f054a4dd5d3862bc485b0ab17af76486')

prepare() {
  cd FFmpeg-n$pkgver

  if [ "$CARCH" == "riscv64" ]; then
    sed -i '1i #include <asm/unistd.h>' libavutil/riscv/cpu.c
  fi
}

build() {
  cd FFmpeg-n$pkgver
  ./configure \
    --prefix=/usr \
    --cc=clang \
    --cxx=clang++ \
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
    --enable-libjxl \
    --disable-libmfx \
    --disable-libmodplug \
    --enable-libmp3lame \
    --disable-libopencore_amrnb \
    --disable-libopencore_amrwb \
    --enable-libopenjpeg \
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
    --enable-libtheora \
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
