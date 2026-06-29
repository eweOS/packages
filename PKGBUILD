# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=appstream
pkgname=(appstream
         appstream-qt)
pkgver=1.1.3
pkgrel=1
pkgdesc='Provides a standard for creating app stores across distributions'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://distributions.freedesktop.org/wiki/AppStream'
license=(LGPL-2.1-or-later)
depends=(cairo
         curl
         fontconfig
         freetype2
         gdk-pixbuf
         glib
         librsvg
         libxml2
	 libxmlb
	 libfyaml
         pango
         zstd)
makedepends=(bash-completion
	     gi-docgen
	     docbook-xsl
	     gobject-introspection
             gperf
	     itstool
	     libxslt
	     meson
	     qt6-tools
             vala
             xmlto)
source=(https://www.freedesktop.org/software/appstream/releases/AppStream-$pkgver.tar.xz
        update-appstream-cache.hook)
sha256sums=('2624f967068427edc94f3979edae3571bb077063f5bc231f737776da527bf467'
            'edc632e4a76ebe5efc76a56fe5f797e5c981cca6f2f0111c7ce0170d1330c788')

build() {
  meson build AppStream-$pkgver \
    --prefix=/usr \
    --libexecdir=lib \
    -Dqt=true \
    -Dcompose=true \
    -Dvapi=true \
    -Dsystemd=false \
    -Dstemming=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_appstream() {
  meson install --destdir "$pkgdir" -C build

  # provided by -qt subpackage
  rm -r "$pkgdir"/usr/{include/AppStreamQt,lib/cmake,lib/libAppStreamQt.*}

  install -Dm644 update-appstream-cache.hook "$pkgdir"/usr/share/libalpm/hooks/90-update-appstream-cache.hook
}

package_appstream-qt() {
  pkgdesc='Qt6 interface for AppStream'
  depends=(appstream
           glib2
           qt6-base)

  meson install --destdir "$pkgdir" -C build

# provided by appstream
  rm -r "$pkgdir"/usr/{bin,include/appstream{,-compose},lib/{appstreamcli-compose,girepository-1.0,libappstream*,pkgconfig},share}
}

