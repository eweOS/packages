# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=freeciv
pkgname=(
  freeciv-server
  freeciv-gtk3 freeciv-gtk4 freeciv-qt freeciv-sdl2 freeciv-stub
  freeciv-mp-gtk3 freeciv-mp-gtk4 freeciv-mp-qt freeciv-mp-cli
  freeciv-tools
  libfreeciv freeciv-data
)
pkgver=3.2.5
pkgrel=1
pkgdesc="Multiuser clone of the famous Microprose game of Civilization"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.freeciv.org/"
license=('GPL-2.0-or-later')
makedepends=(
  'bzip2'
  'cairo'
  'curl'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'gtk4'
  'gtk3'
  'hicolor-icon-theme'
  'icu'
  'lua54'
  'meson'
  'musl'
  'pango'
  'python'
  'qt6-base'
  'readline'
  'sdl2-compat'
  'sdl2-image'
  'sdl2-mixer'
  'sdl2-ttf'
  'sqlite'
  'xz'
  'zlib'
  'zstd'
)
backup=('etc/freeciv/database.lua')
source=("https://downloads.sourceforge.net/sourceforge/$pkgbase/$pkgbase-$pkgver.tar.xz")
sha512sums=('73cd6484b79a4da2de895778d1a01338c46e6f7460dda8bcfeb444a1c74be2806a7e4adca626bc45f6ea87b34a0a535c753889d1cb168a7c274fab541d3ba8d1')

_pick_exec() {
  _pick_ $1 usr/bin/$2
  _pick_ $1 usr/share/man/man6/$2.6
}

_pick_meta() {
  _pick_ $1 usr/share/applications/$2.desktop
  _pick_ $1 usr/share/metainfo/$2.metainfo.xml
}

build() {
  ewe-meson $pkgbase-$pkgver build \
    -D clients=gtk4,gtk3.22,qt,sdl2,stub \
    -D fcmp=gtk4,gtk3,qt,cli \
    -D syslua=true \
    -D readline=true
  ninja -C build
  meson install -C build --destdir "$srcdir/install"
  cd "$srcdir"/install
  # lib
  _pick_ libfreeciv usr/lib/libfreeciv.so
  # etc
  _pick_ data etc/
  # usr/share
  _pick_ data usr/share/freeciv/
  _pick_ data usr/share/doc/
  _pick_ data usr/share/locale/
  _pick_ data usr/share/icons/
  # bin
  _pick_exec server freeciv-server
  _pick_exec gtk3 freeciv-gtk3.22
  _pick_exec gtk4 freeciv-gtk4
  _pick_exec qt freeciv-qt
  _pick_exec sdl2 freeciv-sdl2
  _pick_exec stub freeciv-stub
  _pick_exec mp-gtk3 freeciv-mp-gtk3
  _pick_exec mp-gtk4 freeciv-mp-gtk4
  _pick_exec mp-qt freeciv-mp-qt
  _pick_exec mp-cli freeciv-mp-cli
  _pick_exec tools freeciv-manual
  _pick_exec tools freeciv-ruledit
  _pick_exec tools freeciv-ruleup
  # meta
  _pick_meta server org.freeciv.server
  _pick_meta gtk3 org.freeciv.gtk322
  _pick_meta gtk4 org.freeciv.gtk4
  _pick_meta qt org.freeciv.qt
  _pick_meta sdl2 org.freeciv.sdl2
  _pick_meta mp-gtk3 org.freeciv.gtk3.mp
  _pick_meta mp-gtk4 org.freeciv.gtk4.mp
  _pick_meta mp-qt org.freeciv.qt.mp
  _pick_meta tools org.freeciv.ruledit
  # others(?)
  _pick_ data usr/
}

check() {
  ninja -C build test
}

package_libfreeciv() {
  pkgdesc+=' - Library'
  depends=(
    freeciv-data
    curl
    icu
    libbz2
    lua54
    musl
    sqlite
    xz
    zlib-ng
    zstd
  )
  cp -rv "$srcdir"/pkgs/$pkgname/* "$pkgdir"
}

package_freeciv-server() {
  pkgdesc+=' - Server'
  depends=(
    libfreeciv
    freeciv-data
    readline
  )
  cp -rv "$srcdir"/pkgs/server/* "$pkgdir"
}

package_freeciv-gtk3() {
  pkgdesc+=' (GTK 3)'
  provides=(freeciv)
  depends=(
    libfreeciv
    freeciv-data
    cairo
    gdk-pixbuf
    glib
    gtk3
    pango
    sdl2-compat
    sdl2-mixer
  )
  cp -rv "$srcdir"/pkgs/gtk3/* "$pkgdir"
}

package_freeciv-gtk4() {
  pkgdesc+=' (GTK 4)'
  provides=(freeciv)
  depends=(
    libfreeciv
    freeciv-data
    cairo
    gdk-pixbuf
    glib
    gtk4
    pango
    sdl2-compat
    sdl2-mixer
  )
  cp -rv "$srcdir"/pkgs/gtk4/* "$pkgdir"
}

package_freeciv-qt() {
  pkgdesc+=' (Qt)'
  provides=(freeciv)
  depends=(
    libfreeciv
    freeciv-data
    llvm-libs
    qt6-base
    sdl2-compat
    sdl2-mixer
  )
  cp -rv "$srcdir"/pkgs/qt/* "$pkgdir"
}

package_freeciv-sdl2() {
  pkgdesc+=' (SDL)'
  provides=(freeciv)
  depends=(
    libfreeciv
    freeciv-data
    sdl2-compat
    sdl2-image
    sdl2-mixer
    sdl2-ttf
  )
  cp -rv "$srcdir"/pkgs/sdl2/* "$pkgdir"
}

package_freeciv-stub() {
  pkgdesc+=' (Stub)'
  provides=(freeciv)
  depends=(
    sdl2-compat
    sdl2-mixer
  )
  cp -rv "$srcdir"/pkgs/stub/* "$pkgdir"
}

package_freeciv-mp-gtk3() {
  pkgdesc+=' - Modpack Installer (GTK3)'
  provides=(freeciv-mp)
  depends=(
    freeciv
    glib
    gtk3
  )
  cp -rv "$srcdir"/pkgs/mp-gtk3/* "$pkgdir"
}

package_freeciv-mp-gtk4() {
  pkgdesc+=' - Modpack Installer (GTK4)'
  provides=(freeciv-mp)
  depends=(
    freeciv
    glib
    gtk4
  )
  cp -rv "$srcdir"/pkgs/mp-gtk4/* "$pkgdir"
}

package_freeciv-mp-qt() {
  pkgdesc+=' - Modpack Installer (Qt)'
  provides=(freeciv-mp)
  depends=(
    freeciv
    qt6-base
  )
  cp -rv "$srcdir"/pkgs/mp-qt/* "$pkgdir"
}

package_freeciv-mp-cli() {
  pkgdesc+=' - Modpack Installer (Cli)'
  provides=(freeciv-mp)
  depends=(freeciv)
}

package_freeciv-tools() {
  pkgdesc+=' - Tools'
  depends=(
    freeciv
    qt6-base
  )
  cp -rv "$srcdir"/pkgs/tools/* "$pkgdir"
}

package_freeciv-data() {
  pkgdesc+=' - Data'
  cp -rv "$srcdir"/pkgs/data/* "$pkgdir"
}
