# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=dnsmasq
pkgver=2.93
pkgrel=1
pkgdesc='Network infrastructure daemon for small networks'
url='https://thekelleys.org.uk/dnsmasq/doc.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only OR GPL-3.0-only)
depends=(musl dbus libidn libidn2 libnetfilter_conntrack lua54 nettle gmp
	 nftables)
source=("https://thekelleys.org.uk/dnsmasq/dnsmasq-$pkgver.tar.xz"
	dnsmasq.service dnsmasq.sysusers)
sha256sums=('0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19'
            '4ebcf57535efa2583ae4fe01ba2a1585d10e66e99f26fee3d83aee35f0d1dcce'
            'd0d780a6eda4f2720e7f0bb0f181aee3a0bb6556560a3230b25a1855cb310ba4')

_confopts=(
	HAVE_TFTP
	HAVE_DHCP
	HAVE_DHCP6
	HAVE_SCRIPT
	HAVE_LUASCRIPT
	HAVE_DBUS
	HAVE_IDN
	HAVE_LIBIDN2
	HAVE_CONNTRACK
	HAVE_NFTSET
	HAVE_AUTH
	HAVE_DNSSEC
	HAVE_DUMPFILE
	HAVE_LOOP
	HAVE_INOTIFY
)
_copts=""
for _anopt in "${_confopts[@]}"; do
	_copts+="-D$_anopt "
done

_makeflags=(
	LUA=lua5.4
	PREFIX=/usr
	BINDIR=/usr/bin
	COPTS="$_copts"
)

prepare() {
	cat << EOF > "$pkgname-$pkgver"/bld/get-version
#!/bin/sh
echo "v$pkgver (packaged by eweOS)"
EOF
	chmod +x "$pkgname-$pkgver"/bld/get-version
}

build() {
	cd "$pkgname-$pkgver"

	make "${_makeflags[@]}"
}

package() {
	_install_sysusers_ dnsmasq.sysusers
	_dinit_install_services_ dnsmasq.service

	cd "$pkgname-$pkgver"

	make install "${_makeflags[@]}" DESTDIR="$pkgdir"

	install -Dm644 dnsmasq.conf.example \
		"$pkgdir"/usr/share/dnsmasq/dnsmasq.conf.example
}
