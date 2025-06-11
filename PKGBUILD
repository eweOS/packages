# Maintainer: Deepak Meena <notwho53@gmail.com>

pkgname=lxc
pkgver=6.0.4
pkgrel=1
pkgdesc="The Linux Containers tool set for kernel-level isolation"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://linuxcontainers.org"
depends=('musl' 'bash' 'libseccomp' 'libcap' 'rsync' 'wget')
makedepends=('meson' 'lua' 'python-setuptools')
license=('LGPL-2.0-or-later')
backup=('etc/lxc/default.conf'
	'etc/default/lxc')
source=("https://linuxcontainers.org/downloads/lxc/$pkgname-${pkgver}.tar.gz")
sha256sums=('872d26ce8512b9f993d194816e336bf9f3ad8326f22dc24ef0f01f85599fa8b9')


build() {
  export LDFLAGS="$LDFLAGS -lunwind"

  # Disable man-pages for now since dockbook2x is missing
  ewe-meson $pkgbase-$pkgver build -Dapparmor=false \
      -Dman=false \
      -Dinit-script=[] \
      -Ddbus=false \
      -Ddistrosysconfdir=/etc/default

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
}
