# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=appstream
pkgver=1.0.1
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
sha256sums=('fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528b56436e0150829203b'
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
