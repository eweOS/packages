# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=appstream
pkgver=1.0.2
pkgrel=1
pkgdesc='Provides a standard for creating app stores across distributions'
arch=(x86_64 aarch64 riscv64)
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
	 libyaml
         pango
         zstd)
makedepends=(docbook-xsl
	     gobject-introspection
             gperf
	     itstool
	     libxslt
	     meson)
source=(https://www.freedesktop.org/software/appstream/releases/AppStream-$pkgver.tar.xz
        update-appstream-cache.hook)
sha256sums=('1a5148ca97dcbf5eb6e9c380278bb0d20938569292ea8652df1b3cac8bd2736b'
            'edc632e4a76ebe5efc76a56fe5f797e5c981cca6f2f0111c7ce0170d1330c788')

build() {
  meson build AppStream-$pkgver \
    --prefix=/usr \
    --libexecdir=lib \
    -Dcompose=true \
    -Dsystemd=false \
    -Dstemming=false \
    -Ddocs=false \
    -Dapidocs=false
  meson compile -C build
}

package_appstream() {
  meson install --destdir "$pkgdir" -C build
  install -Dm644 update-appstream-cache.hook "$pkgdir"/usr/share/libalpm/hooks/90-update-appstream-cache.hook
}
