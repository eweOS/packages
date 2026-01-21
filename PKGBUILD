# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=glycin
pkgname=(
  glycin
  glycin-gtk4
)
pkgver=2.0.7
pkgrel=1
pkgdesc="Sandboxed and extendable image decoding"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gnome.pages.gitlab.gnome.org/glycin/"
license=('MPL-2.0 OR LGPL-2.1-or-later')
depends=(
  bubblewrap
  cairo
  fontconfig
  llvm-libs
  glib2
  musl
  lcms2
  libjxl
  librsvg
  libseccomp
)
makedepends=(
  clang
  git
  gtk4
  gobject-introspection
  libheif
  meson
  rust
  vala
)
checkdepends=(
  dav1d
  ffmpeg
  rav1e
  svt-av1
)
source=(
  "git+https://gitlab.gnome.org/GNOME/glycin.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/sophie-h/test-images.git"
  0001-fix-setup-integration-test-regex-for-keyfile-spaces.patch
)
sha256sums=('d3388fe6f1a1b78866c828400effd1e8d50989e8eba1814edffd2edfb5bf7e30'
            'SKIP'
            '1284a1ace2b44e89576a3dfabdf0bbd6fee50047d0c41f3d64d9e8b016787505')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd glycin

  _patch_

  git submodule init
  git submodule set-url tests/test-images "$srcdir/test-images"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

  # Match cargo_home in meson.build
  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --locked --target "$RUSTHOST"
}

build() {
  ewe-meson glycin build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_glycin() {
  optdepends=(
    'libheif: Load .avif, .heic and .heif'
  )
  provides=(libglycin-2.so)

  meson install -C build --destdir "$pkgdir" --no-rebuild

  cd "$pkgdir"
  _pick_ gtk4 usr/include/glycin-gtk4-*
  _pick_ gtk4 usr/lib/girepository-1.0/GlyGtk4-*
  _pick_ gtk4 usr/lib/libglycin-gtk4-*
  _pick_ gtk4 usr/lib/pkgconfig/glycin-gtk4-*
  _pick_ gtk4 usr/share/gir-1.0/GlyGtk4-*
  _pick_ gtk4 usr/share/vala/vapi/glycin-gtk4-*
}

package_glycin-gtk4() {
  pkgdesc+=" - GTK4 integration"
  depends=(
    fontconfig
    llvm-libs
    glib2
    musl
    glycin
    gtk4
    lcms2
    libseccomp
  )
  provides=(libglycin-gtk4-2.so)

  mv pkgs/gtk4/* "$pkgdir"
}
