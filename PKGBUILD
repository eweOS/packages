# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swayimg
pkgver=4.5
pkgrel=2
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
    'libdrm'
    'libexif.so'
    'libheif'
    'libjpeg.so'
    'libjson-c.so'
    'libpng'
    'libraw'
    'librsvg-2.so'
    'libsixel'
    'libtiff'
    'libwayland-client.so'
    'libwebp'
    'libxkbcommon'
    'linux-headers'
    'musl'
    'openexr'
)
url='https://github.com/artemsen/swayimg'
source=("$pkgname-$pkgver.tar.gz::https://github.com/artemsen/swayimg/archive/v$pkgver.tar.gz")
sha256sums=('4f0c491f873e37b85342a92d9b0ecc570a059bb971040c23075d4c3ab401680b')

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
