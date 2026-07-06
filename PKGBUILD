# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=mutt
pkgver=2.4.1
pkgrel=1
pkgdesc='The Mutt E-mail Client.'
url='http://www.mutt.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(ncurses sqlite zlib-ng openssl libsasl gdbm libidn2 gpgme
	 libgpg-error)
source=("http://ftp.mutt.org/pub/mutt/mutt-$pkgver.tar.gz")
sha256sums=('5624321f0b1cc1eff6cab9ef08f25954ff64c51b33d4bf3b99484cf1edd8cfff')

build () {
	cd mutt-$pkgver

	local features=(
		--disable-largefile
		--enable-autocrypt
		--enable-gpgme
		--enable-pgp
		--enable-smime
		--enable-sidebar
		--enable-compressed
		--disable-dotlock
		--enable-pop
		--enable-imap
		--enable-smtp
		--disable-debug
		--enable-flock
		--enable-fcntl
		--enable-filemonitor
		--enable-warnings
		--enable-nfs-fix
		--enable-mailtool
		--disable-locale-fix
		--enable-exact-address
		--enable-hcache
	)

	local libs=(
		--with-sqlite3
		--without-mixmaster
		--with-ncurses
		--without-bundle-regex
		--without-gss
		--with-zlib
		--with-ssl
		--without-gnutls
		--with-sasl
		--without-gsasl
		--without-tokyocabinet
		--with-gdbm
		--without-idn
		--with-idn2
	)

	./configure --prefix=/usr \
		${features[*]}				\
		${libs[*]}				\
		--sysconfdir=/etc			\
		--with-mailpath=/var/spool/mail

	make
}

# No real testsuite included, the "check" target checks TABs and possible code
# security problems, and running shellcheck on a script. It seems for
# development purpose only.

package() {
	cd mutt-$pkgver

	make install DESTDIR=$pkgdir
	rm $pkgdir/etc/*.dist
}
