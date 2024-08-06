# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=swayimg
pkgver=3.0
pkgrel=1
pkgdesc='A lightweight image viewer for Wayland display servers'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
makedepends=(
    'bash-completion'
    'meson'
    'ninja'
    'wayland-protocols'
)
depends=(
    'cairo'
    'hicolor-icon-theme'
    'libexif.so'
    'fontconfig'
    'freetype2'
    'giflib'
    'glib'
    'libjpeg.so'
    'libjson-c.so'
    'libpng'
    'librsvg-2.so'
    'libtiff'
    'libwayland-client.so'
    'libwebp'
    'libxkbcommon'
    'openexr'
)
url='https://github.com/artemsen/swayimg'
source=("$pkgname-$pkgver.tar.gz::https://github.com/artemsen/swayimg/archive/v$pkgver.tar.gz")
sha256sums=('aaea410876aa461d6601f86d5c7bc2cf212a0ecfc28b2a602e53d0f383d710ca')

build() {
    ewe-meson build ${pkgname}-${pkgver} \
        -D bash=enabled \
        -D desktop=true \
        -D exif=enabled \
        -D avif=disabled \
        -D gif=enabled \
        -D heif=disabled \
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
