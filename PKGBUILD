# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kbd
pkgver=2.8.0
pkgrel=1
pkgdesc="Keytable files and keyboard utilities"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://www.kbd-project.org"
license=('GPL-2.0-or-later')
depends=(pam)
makedepends=(check git linux-headers)
# TODO: valgrind isn't available on loongarch64
# checkdepends=(valgrind)
source=(
  git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git#tag=v$pkgver
  fix-euro2.patch
  0001-Makefile.common-Get-access-rights-with-stat.patch
  'config.rpath::https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob_plain;f=build-aux/config.rpath;hb=HEAD'
)
backup=('etc/pam.d/vlock')
sha256sums=('8bcfc5888ff1f2eafc6b5dd87c36c0f7b167fbdaba066cec59762e5c6f9bdb72'
            'a5e0167b6a82a9eb4d581d56baab930c2d80f5541dc34630460b73e1115384b8'
            'ad121d6b04304580719db552b1d729465c70f37a2c6aa20703f172efb2a179a0'
            '772c44d89098cbcc95b12cee420fd2f1833ac2da0338df99c5e590d1c1672234')

prepare() {
  _patch_ "${pkgname}"

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
  autoreconf -if
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/kbd --mandir=/usr/share/man --enable-optional-progs
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
}

# Require valgrind to run
# check() {
#  cd "${pkgname}"
#
#  make check
# }

package() {
  cd "${pkgname}"
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR="${pkgdir}" install

  # remove busybox commands
  for exe in chvt deallocvt fgconsole kbd_mode openvt setfont setkeycodes setlogcons showkey vlock; do
    rm $pkgdir/usr/bin/$exe
  done
}
