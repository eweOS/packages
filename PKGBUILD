# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swayimg
pkgver=4.4
pkgrel=1
pkgdesc='A lightweight image viewer for Wayland display servers'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
makedepends=(
    'bash-completion'
    'meson'
    'ninja'
    'wayland-protocols'
)
depends=(
    'cairo'
    'fontconfig'
    'freetype2'
    'giflib'
    'glib'
    'hicolor-icon-theme'
    'libavif'
    'libexif.so'
    'libheif'
    'libjpeg.so'
    'libjson-c.so'
    'libpng'
    'libraw'
    'librsvg-2.so'
    'libtiff'
    'libwayland-client.so'
    'libwebp'
    'libxkbcommon'
    'libsixel'
    'openexr'
)
url='https://github.com/artemsen/swayimg'
source=("$pkgname-$pkgver.tar.gz::https://github.com/artemsen/swayimg/archive/v$pkgver.tar.gz")
sha256sums=('52f2a64766f3948447e9da5fe14bc0c644c45c7de6c564df69ad66a448a514a9')

build() {
    ewe-meson build ${pkgname}-${pkgver} \
        -D bash=enabled \
        -D desktop=true \
        -D exif=enabled \
        -D avif=enabled \
        -D gif=enabled \
        -D heif=enabled \
        -D jpeg=enabled \
        -D jxl=disabled \
        -D man=true \
        -D png=enabled \
        -D svg=enabled \
        -D tiff=enabled \
        -D version="$pkgver" \
        -D webp=enabled \
        -D zsh=enabled
    ninja -C build
}

package(){
    DESTDIR="$pkgdir" ninja -C build install

    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
