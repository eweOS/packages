# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=pipewire
pkgname=(
  pipewire libpipewire
)
pkgver=1.2.3
pkgrel=2
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(
  'meson'
  'linux-headers'
  'dbus'
  'libudev'
  'libsndfile'
  'libusb'
  'libpulse'
  'alsa-lib'
  'glib'
)
checkdepends=(
  desktop-file-utils
  openal
)
source=(
  "https://gitlab.freedesktop.org/pipewire/${pkgbase}/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  pipewire.user.service
  pipewire-pulse.user.service
  pipewire.conf.in
)
sha256sums=('f2645dda4294a46b58727bf81352f13180be232e74ff7fccbc44f30d31fa4766'
            '4d808f22ea2adc5137d98702b21aeecbe00e15fed4ab9768da7d68a0acbe8560'
            'bca9d53e4c5cf0eb1ecb7124365abf5ea740889887690423fef1d7b377b3660b'
            'a1d7812aabba038ff1d90a0af2139f0c420419c5f66ee401b9bc45d0445edfdd')

prepare()
{
  cp pipewire.conf.in $pkgbase-$pkgver/src/daemon/pipewire.conf.in
}

build()
{
  local features=(
    -D man=disabled
    -D docs=disabled
    -D gstreamer=disabled
    -D gstreamer-device-provider=disabled
    -D systemd=disabled
    -D systemd-user-service=disabled
    -D pipewire-jack=disabled
    -D pipewire-v4l2=disabled
    -D pw-cat=disabled
    -D bluez5=disabled
    -D audiotestsrc=disabled
    -D jack=disabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D videoconvert=disabled
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
    'dbus'
    'libudev'
    'libsndfile'
    'libusb'
    'libpulse'
    'alsa-lib'
    'glib'
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
}

package_libpipewire() {
  pkgdesc+=" - client library"
  provides=(lib$_pwname.so)
  mv pkgs/lib/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/COPYING
}
