# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pipewire
pkgname=(
  pipewire libpipewire
  gst-plugin-pipewire
  pipewire-docs
)
pkgver=1.6.6
pkgrel=2
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(
  'alsa-lib'
  'dbus'
  'doxygen'
  'ffmpeg'
  'glib'
  'gstreamer-devel'
  'libebur128'
  'libpulse'
  'libsndfile'
  'libudev'
  'libusb'
  'linux-headers'
  'meson'
  'fftw'
)
checkdepends=(
  desktop-file-utils
  openal
)
optdepends=(
  'gst-plugin-pipewire: GStreamer plugin'
)
source=(
  "https://gitlab.freedesktop.org/pipewire/${pkgbase}/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  pipewire.user.service
  pipewire-pulse.user.service
  pipewire.conf.in
)
sha256sums=('b2a0a8de6946b8145a453639c936555beb0cbf2f2486e0b1c676cffdaaf029d9'
            'b2b7f7730f1607fccb59248dd48da3eed577afc35feef24faac0193de5832191'
            '2a0807319f60671483de2e015427241d8f9224ccce2616eff143377c0a840193'
            'a1d7812aabba038ff1d90a0af2139f0c420419c5f66ee401b9bc45d0445edfdd')

prepare()
{
  cp pipewire.conf.in $pkgbase-$pkgver/src/daemon/pipewire.conf.in
}

build()
{
  local features=(
    -D docs=enabled
    -D man=enabled
    -D libsystemd=disabled
    -D logind=disabled
    -D systemd-user-service=disabled
    -D pipewire-jack=disabled
    -D pipewire-v4l2=disabled
    -D pw-cat=disabled
    -D bluez5=disabled
    -D audiotestsrc=disabled
    -D jack=disabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D videotestsrc=disabled
    -D volume=disabled
    -D sdl2=disabled
    -D roc=disabled
    -D avahi=disabled
    -D echo-cancel-webrtc=disabled
    -D session-managers='[]'
    -D raop=disabled
    -D lv2=disabled
    -D x11=disabled
    -D x11-xfixes=disabled
    -D libcanberra=disabled
    -D legacy-rtkit=false
    -D avb=disabled
    -D flatpak=disabled
    -D libmysofa=disabled
    -D libffado=disabled
    -D selinux=disabled
    -D snap=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
    -D onnxruntime=disabled
  )

  ewe-meson $pkgbase-$pkgver build \
    "${features[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pwname=pipewire-0.3
_spaname=spa-0.2

package_pipewire()
{
  license+=(
    # libspa-alsa
    LGPL-2.1-or-later
  )
  depends+=(
    "libpipewire=$epoch:$pkgver-$pkgrel"
    'alsa-lib'
    'dbus'
    'ffmpeg'
    'fftw'
    'glib'
    'libebur128'
    'libpulse'
    'libsndfile'
    'libudev'
    'libusb'
  )

  meson install -C build --destdir "$pkgdir"

  # ALSA configuration
  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf \
    "$pkgdir/etc/alsa/conf.d/99-pipewire-default.conf"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  # pulse replacement

  mkdir -p "$pkgdir/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  _dinit_install_user_services_ $srcdir/pipewire.user.service $srcdir/pipewire-pulse.user.service

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/COPYING

  cd $pkgdir

  # Replace copies with symlinks
  for _f in pipewire-{aes67,avb,pulse}; do
    cmp usr/bin/pipewire usr/bin/$_f
    ln -sf pipewire usr/bin/$_f
  done

  _pick_ lib usr/include/{$_pwname,$_spaname}
  _pick_ lib usr/lib/lib$_pwname.so*
  _pick_ lib usr/lib/pkgconfig/lib{$_pwname,$_spaname}.pc
  _pick_ gst usr/lib/gstreamer-1.0
  _pick_ doc usr/share/{man,doc}
}

package_libpipewire() {
  pkgdesc+=" - client library"
  provides=(lib$_pwname.so)
  mv pkgs/lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/COPYING
}

package_gst-plugin-pipewire() {
  pkgdesc+=" - pipewire plugin"
  depends=(
    glib2
    gst-plugins-base-libs
    gstreamer
    lib$_pwname.so
    pipewire
  )
  mv pkgs/gst/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/COPYING
}

package_pipewire-docs() {
  depends=()
  pkgdesc+=' - documentation'

  mv pkgs/doc/* "$pkgdir"
  _install_license_ "$pkgbase-$pkgver"/COPYING
}
