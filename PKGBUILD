# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpd
pkgver=0.24.13
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.musicpd.org/"
license=(
  BSD-2-Clause
  GPL-2.0-or-later
)
depends=(
  hicolor-icon-theme
  pcre2
  zlib
  zziplib
)
makedepends=(
  alsa-lib
  boost
  bzip2
  curl
  dbus
  expat
  ffmpeg
  flac
  fluidsynth
  fmt
  git
  icu
  lame
  libmpdclient
  libogg
  libpulse
  libsamplerate
  libsndfile
  libvorbis
  linux-headers
  meson
  nlohmann-json
  openal
  pipewire
  sqlite
)
backup=(etc/$pkgname.conf)
source=(
  $pkgname::git+https://github.com/MusicPlayerDaemon/MPD.git#tag=v${pkgver}
  $pkgname.conf
  $pkgname.sysusers
  $pkgname.tmpfiles
  $pkgname.service
  back_inserter.patch
)
sha512sums=('6503530a05595a44e7a8f73e9b76dd46f4210081192036687b135083ccc6d3e33fbaf7aff00d58c0ccf70055e7ad74e3669600f9883f08b42796b52e70cd9997'
            '00be5ce1b167492946e049c66de472a482ff1e1c8939f6029626ff842f6370f1b7a046958a8ae58d56eb9eb192a05448fcb2ec072fe8614a836ee9e9df4dd027'
            '88ba2b6624e7dddd13a51e6fb9c7a65226d0c5b0645183901d6434c23fa0aca605989be0c600f2197c99c1b4c64396477aa15ab3c427087e86bb652977428aae'
            'f0ea57836f575dec93b12afb6c730c706b8745d25811152960dcd1f079760c2adda0b8af8e16e8329cc073c3b4e00edbbeea959ec6e1f5003ea77b0b6478262a'
            '591364387c8c024ec7a8b1d30cccdd432836388ebeed366a686086bff3c0b9497504c03a0cb0da4ba825a06020b8ae863796edf27fd92e95f3ed44d4b29b30b9'
            '8b2618202101fef6ba9d69ffe641a66d83f22a678ebd9d474327274fbb5ffdc21497fdf69504425943a66af55d5a77d736f62dcc55f50eca2c4aa99c8d3bd92b')

prepare() {
  _patch_ $pkgname
}

build() {
  local _disabled_comps=(
    adplug shine tremor io_uring chromaprint id3tag cdio_paranoia mms qobuz
    iso9660 ao jack shout audiofile faad gme mad mikmod modplug openmpt mpcdec
    mpg123 wavpack wildmidi sidplay twolame libmpdclient nfs
  )
  
  # NOTE: sndio conflicts with alsa
  # NOTE: nfs: field has incomplete type 'struct timeval'
  local _meson_options=(
    -D documentation=disabled
    -D sndio=disabled
    -D systemd=disabled
    -D b_ndebug=true
  )
  
  for _disabled_comp in "${_disabled_comps[@]}"; do
    _meson_options+=(-D ${_disabled_comp}=disabled)
  done

  ewe-meson "${_meson_options[@]}" build $pkgname
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  depends+=(
    alsa-lib libasound.so
    bzip2 libbz2.so
    curl libcurl.so
    dbus libdbus-1.so
    expat libexpat.so
    ffmpeg libav{codec,filter,format,util}.so
    flac libFLAC.so
    fluidsynth libfluidsynth.so
    fmt libfmt.so 
    icu libicui18n.so libicuuc.so
    lame libmp3lame.so
    libogg libogg.so
    pipewire
    libmpdclient libmpdclient.so
    libpulse libpulse.so
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libvorbis libvorbis{,enc}.so
    openal libopenal.so
    sqlite libsqlite3.so
  )

  DESTDIR="$pkgdir" ninja -C build install
  install -vDm 644 $pkgname/doc/${pkgname}conf.example -t "$pkgdir/usr/share/doc/$pkgname/"
  # NOTE: BSD-2-Clause license file currently missing: https://github.com/MusicPlayerDaemon/MPD/issues/1877
  # install -vDm 644 $pkgname-$pkgver/LICENSES/BSD-2-Clause -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname.conf -t "$pkgdir/etc/"
  install -vDm 644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm 644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
