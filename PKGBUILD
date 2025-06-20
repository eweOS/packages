# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=backends
pkgname=sane
pkgver=1.4.0
pkgrel=1
pkgdesc="Scanner Access Now Easy"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.com/sane-project/backends"
license=(
  GPL-2.0-or-later
  LicenseRef-GPL-2.0-or-later-with-linking-exception
)
depends=(
  bash
  cairo
  libpng
  curl
  glib2
  libjpeg-turbo
  libtiff
  libusb
  libxml2
  poppler-glib
)
makedepends=(
  autoconf-archive
  python
  texlive-latexextra
)
optdepends=(
  'sane-airscan: for scanners working in driverless mode'
)
provides=(libsane.so)
source=(
  $url/-/archive/$pkgver/$_name-$pkgver.tar.gz
  sane.sysusers
)
sha512sums=('69adc9e4a7c7252ff677c510c4112096c3c4b00525113795d5d2ecd0efe8716a556c6c403df685d0e360eae72546ad55ff9dd27b3fde5c5b1b9d13dbcd735465'
            'd8cd194b57eff2249df2b8d540a892e518aa3e3bba6387211ed21230dc235e98c49b71f262f0b1007e8c859c59776410840376244e0aec1f06363881b2c81fd8')

prepare() {
  # extract custom license exception
  sed '1,41p' $_name-$pkgver/backend/dll.c > LicenseRef-GPL-2.0-or-later-with-linking-exception.txt

  cd $_name-$pkgver
  # copy translation files so they become reproducible: https://gitlab.com/sane-project/backends/-/issues/647
  cp -v po/en{_GB,@quot}.po
  cp -v po/en{_GB,@boldquot}.po
  # create version files, so that autotools macros can use them:
  # https://gitlab.com/sane-project/backends/-/issues/440
  printf "%s\n" "$pkgver" > .tarball-version
  printf "%s\n" "$pkgver" > .version
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-locking
    --disable-rpath
    --docdir="/usr/share/doc/$pkgname"
    --enable-pthread
    --localstatedir=/var
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --without-avahi
    --with-libcurl
    --with-pic
    --with-poppler-glib
    --disable-parport-directio
    --without-systemd
    --without-snmp
    --without-v4l
    --with-usb
  )

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"

  # circumvent overlinking in libraries
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install

  _install_sysusers_ $srcdir/sane.sysusers

  # install custom license
  install -vDm 644 ../LicenseRef-GPL-2.0-or-later-with-linking-exception.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove old ChangeLogs
  rm -rvf "$pkgdir/usr/share/doc/$pkgname/ChangeLogs/"

  # add files below /etc/sane.d to backup array
  cd "$pkgdir"
  # trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f | sort) )
}
