# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=mutt
pkgver=2.2.13
pkgrel=1
pkgdesc='The Mutt E-mail Client.'
url='http://www.mutt.org/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(ncurses sqlite zlib-ng openssl libsasl gdbm libidn2 gpgme
	 libgpg-error)
source=("http://ftp.mutt.org/pub/mutt/mutt-$pkgver.tar.gz")
sha256sums=('eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb')

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

check() {
	cd mutt-$pkgver
	make check
}

package() {
	cd mutt-$pkgver

	make install DESTDIR=$pkgdir
	rm $pkgdir/etc/*.dist
}
