# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fakeroot
pkgname=(fakeroot fakeroot-tcp)
pkgver=1.36
pkgrel=1
pkgdesc='Tool for simulating superuser privileges'
arch=(x86_64 aarch64 riscv64)
license=('GPL')
url='https://tracker.debian.org/pkg/fakeroot'
groups=('base-devel')
depends=('musl' 'filesystem' 'util-linux')
makedepends=('libcap' 'git' 'linux-headers')
source=("git+https://salsa.debian.org/clint/fakeroot.git#tag=upstream/$pkgver"
	musl.patch
	xstatjunk.patch)
sha256sums=('6cf5ddf3fdb4d2ece465e4dc51b4d0b1a265c241bdaf2858f0a1519a9b4e8c63'
            '9396e4cd666c9659f8eb2967183e32a0bc472cd89802103587e26832c054815a'
	    '8680c89fe37a75b756585a505a077b26af8a089d05466cbf86522adc81d84e1b')

prepare()
{
  # FIXME: package po4a
  cd $srcdir/$pkgbase
  sed -i 's/SUBDIRS = .*//'  doc/Makefile.am
  _patch_ $srcdir/$pkgbase
}

build()
{
  cd $srcdir/$pkgbase
  autoreconf -fiv
  cp -r $srcdir/$pkgbase $srcdir/$pkgbase-tcp

  cd $srcdir/$pkgbase
  ./configure --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=sysv
  make

  cd $srcdir/$pkgbase-tcp
  ./configure --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=tcp
  make
}

package_fakeroot()
{
  provides=($pkgbase)
  conflicts=($pkgbase)
  cd $srcdir/$pkgbase
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/etc/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "$pkgdir/etc/ld.so.conf.d/fakeroot.conf"
}

package_fakeroot-tcp()
{
  pkgdesc="$pkgdesc (TCP IPC)"
  provides=($pkgbase)
  conflicts=($pkgbase)
  cd $srcdir/$pkgbase-tcp
  make DESTDIR="$pkgdir" install

  install -dm0755 "$pkgdir/etc/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "$pkgdir/etc/ld.so.conf.d/fakeroot.conf"
}
