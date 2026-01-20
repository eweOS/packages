# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprwire
pkgver=0.2.1
pkgrel=1
pkgdesc='A fast and consistent wire protocol for IPC'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
depends=(llvm-libs
         musl
         hyprutils
         libffi
         pugixml)
makedepends=(cmake)
provides=(libhyprwire.so)
_archive="$pkgname-$pkgver"
# 0001: backport: missing string_view header
# https://github.com/hyprwm/hyprwire/pull/9
# 0002: downstream: fix for libc++: include unistd.h to fix read() write()
source=(
  "$url/archive/v$pkgver/$_archive.tar.gz"
  0001-backport-string_view.patch::https://github.com/hyprwm/hyprwire/commit/1079777525b30a947c8d657fac158e00ae85de9d.patch
  0002-fix-read-write.patch
)
sha256sums=('a6370db771213fe10ebca5a2da748070a7034b09131847f973fda5d60b473c11'
            '97d6bb27eabdbb83d00dda3197e4a4e0d0c3f36f1f17e34695c9aeef11352bc0'
            'c16ac234f6c64f25238ae3b55c6c1190371b2badc0b14acaf17f19fa4734172e')

prepare() {
  _patch_ "$_archive"
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake -B build -S "$_archive" -W no-dev ${cmake_options[@]}
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive"/LICENSE
}

