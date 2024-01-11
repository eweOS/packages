# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plymouth
pkgver=24.004.60
pkgrel=3
pkgdesc='Graphical boot splash screen'
arch=(x86_64 aarch64 riscv64)
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL2')
depends=('cairo' 'fontconfig' 'freetype2' 'libdrm' 'libevdev' 'libpng' 'libxkbcommon' 'pango' 'musl-rpmatch')
makedepends=('meson')
backup=('etc/plymouth/plymouthd.conf')
source=("https://www.freedesktop.org/software/$pkgname/releases/$pkgname-$pkgver.tar.xz" 0_musl.patch plymouth-boot.service)
sha256sums=('f3f7841358c98f5e7b06a9eedbdd5e6882fd9f38bbd14a767fb083e3b55b1c34'
            'fc984b17fbb89d2bb2692a05257544a3b0add6db073c94fa4471a4f8982b5df2'
            'f78770fc645f16e83d0feea16518f6dbd85c23b0926f6453ed27fb9cc4e35719')

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
  ewe-meson build $pkgname-$pkgver -D gtk=disabled -D systemd-integration=false -D docs=false -D udev=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"
  rm $pkgdir/usr/lib/plymouth/plymouth-update-initrd
  rm $pkgdir/usr/lib/plymouth/plymouth-generate-initrd
  _dinit_install_services_ plymouth-boot.service
  _dinit_enable_services_ plymouth-boot
}

