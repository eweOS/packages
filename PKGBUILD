# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kbd
pkgver=2.6.4
pkgrel=1
pkgdesc="Keytable files and keyboard utilities"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://www.kbd-project.org"
license=('GPL-2.0-or-later')
depends=(pam)
makedepends=(check git linux-headers)
source=(
  git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git#tag=v$pkgver
  fix-euro2.patch
  'config.rpath::https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/config.rpath;hb=HEAD'
)
backup=('etc/pam.d/vlock')
sha256sums=('eb0b2768ab0f577ce91367fb1935c7fc831123c36cd42a4067da80833bb483d5'
            'a5e0167b6a82a9eb4d581d56baab930c2d80f5541dc34630460b73e1115384b8'
            '46e05ef0ed1805729438662c040e85b0abdeba5fbedd448c4d79a3f0f3af6250')

prepare() {
  cd "${pkgname}"
  cp $srcdir/config.rpath config/
  # rename keymap files with the same names
  # this is needed because when only name of keymap is specified
  # loadkeys loads the first keymap it can find, which is bad (see FS#13837)
  # this should be removed when upstream adopts the change
  mv data/keymaps/i386/qwertz/cz{,-qwertz}.map
  mv data/keymaps/i386/olpc/es{,-olpc}.map
  mv data/keymaps/i386/olpc/pt{,-olpc}.map
  mv data/keymaps/i386/fgGIod/trf{,-fgGIod}.map
  mv data/keymaps/i386/colemak/{en-latin9,colemak}.map
  # fix euro2 #28213
  patch -Np1 -i ../fix-euro2.patch
  autoreconf -if
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/kbd --mandir=/usr/share/man --enable-optional-progs
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
}

check() {
  cd "${pkgname}"

# This test is expected to fail since kbd-fix-loadkmap-compat.patch modifies the binary format
  sed -e 's|dumpkeys-bkeymap ||' -i tests/Makefile

  make check
}

package() {
  cd "${pkgname}"
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR="${pkgdir}" install

  # remove busybox commands
  for exe in chvt deallocvt fgconsole kbd_mode openvt setfont setkeycodes setlogcons showkey vlock; do
    rm $pkgdir/usr/bin/$exe
  done
}
