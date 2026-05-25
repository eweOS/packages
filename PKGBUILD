# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plymouth
pkgver=26.134.222
pkgrel=1
pkgdesc='Graphical boot splash screen'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL2')
depends=('cairo' 'fontconfig' 'freetype2' 'libdrm' 'libevdev' 'libpng' 'libxkbcommon' 'pango' 'musl-rpmatch')
makedepends=('meson' 'linux-headers' 'librsvg')
backup=('etc/plymouth/plymouthd.conf')
source=(
  "https://www.freedesktop.org/software/$pkgname/releases/$pkgname-$pkgver.tar.xz"
  0_musl.patch
  copy_pango.patch
  plymouth-boot.service
  plymouth-boot.sh
)
sha256sums=('6ee1068216c5047923fabf0f6aa583e9d77cab383077358df3fc22f2ee398bb0'
            'fc984b17fbb89d2bb2692a05257544a3b0add6db073c94fa4471a4f8982b5df2'
            '79c3dd078199f2447a71ac6669fa63fd7f1736bcc8283d31bdc19a552c8bd948'
            '60f2fb37af5edcab74dd42e7c30d23997f7fecd2f39afb1bedfa1426b2a39879'
            '0e3f9e86368625be6a23408d56096c233c3a430ba148c55b663be956d20692b1')

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  sed -i 's@#include <execinfo.h>@@g' src/main.c
  sed -i '1s/^/#include <rpmatch.h>\n/' src/libply/ply-command-parser.c
  sed -i 's/--sparse=always//g' scripts/plymouth-populate-initrd.in
  sed -i 's@--reference="$PLYMOUTH_SYSROOT$_file"@$(stat -c "%a" "$PLYMOUTH_SYSROOT$_file")@g' scripts/plymouth-populate-initrd.in
  sed -i 's@add_input_devices_to_renderer (manager, renderer);@@g' src/libply-splash-core/ply-device-manager.c
}

build() {
  ewe-meson build $pkgname-$pkgver -D gtk=disabled -D systemd-integration=false -D docs=false -D udev=disabled -D logo=/usr/share/pixmaps/eweos-logo.png
  meson compile -C build

  # Convert logo for the spinner theme
  rsvg-convert '/usr/share/pixmaps/eweos-logo-text-dark.svg' -o eweos-logo-text-dark.png
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"
  rm $pkgdir/usr/lib/plymouth/plymouth-update-initrd
  rm $pkgdir/usr/lib/plymouth/plymouth-generate-initrd
  _dinit_install_services_ plymouth-boot.service
  _dinit_enable_services_ plymouth-boot
  install -Dm 0755 plymouth-boot.sh $pkgdir/usr/lib/dinit/exec/plymouth-boot

  # Install logo for the spinner theme
  install -Dm644 eweos-logo-text-dark.png "$pkgdir/usr/share/$pkgname/themes/spinner/watermark.png"
}

