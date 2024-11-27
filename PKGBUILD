# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar
pkgver=4.19.4
pkgrel=1
pkgdesc="Modern, fast and easy-to-use file manager for Xfce"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/thunar/start"
license=('GPL-2.0-or-later' 'LGPL-2.1-only')
groups=('xfce4')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'pcre2' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('git' 'intltool' 'gobject-introspection' 'xfce4-panel' 'xfce4-dev-tools')
optdepends=('catfish: file searching'
            'gvfs: trash support, mounting with udisk and remote filesystems'
            'tumbler: thumbnail previews'
            'thunar-volman: removable device management'
            'thunar-archive-plugin: archive creation and extraction'
            'thunar-media-tags-plugin: view/edit ID3/OGG tags')
source=("git+https://gitlab.xfce.org/xfce/thunar.git#tag=$pkgname-$pkgver" no-x11-fix-flag.patch)
sha256sums=('9253de4cd0547d37e9b28c1eb447e43e2abac10b6f3044a363c764af88d86b59'
            'd5251e52a71948f4f4d4f743025560157785ec1508c0e38e4d35aae62ff229cc')

prepare() {
  _patch_ $pkgname
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-gudev \
    --enable-notifications \
    --enable-exif \
    --enable-gtk-doc \
    --disable-debug \
    --enable-maintainer-mode \
    --disable-wallpaper-plugin
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  
  #TODO: user/thunar.service
  rm -r $pkgdir/usr/lib/systemd
}
