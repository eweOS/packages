# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=qemu-user-static
pkgname=(qemu-user-static
	 qemu-user-static-{aarch64,alpha,arm,i386,loongarch64,m68k,mips,mips64}
	 qemu-user-static-{mips64el,mipsel,ppc,ppc64,riscv32,riscv64,s390x}
	 qemu-user-static-{sparc,sparc64,x86_64})
pkgver=9.1.0
pkgrel=2
pkgdesc='QEMU user mode emulation (static build)'
url='https://www.qemu.org/'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0 BSD-2-Clause BSD-3-Clause FSFAP GPL-1.0-or-later
	 GPL-2.0-only GPL-2.0-or-later GPL-2.0-or-later-WITH-GCC-exception-2.0
	 LGPL-2.0-only LGPL-2.0-or-later MIT CC-BY-3.0)
makedepends=(meson ninja
	     linux-headers
	     glib-static zlib-ng-static)
qemu_archs=(aarch64 alpha arm i386 loongarch64 m68k mips mips64 mips64el
	    mipsel ppc ppc64 riscv32 riscv64 s390x sparc sparc64 x86_64)
source=("https://download.qemu.org/qemu-$pkgver.tar.xz"
	"binfmt-list")
sha256sums=('816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834'
            '3ec211c95be104d45eee80911bbef64b51e7ac6da9c5ca04ec9fec5f5270ed96')

user_targets=""
for t in "${qemu_archs[@]}"; do
	user_targets="$t-linux-user,$user_targets"
done
user_targets=${user_targets:0:-1}

build () {
	local common_options=(
		--prefix=/usr
		--enable-lto
	)
	local host_options=()
	[ $CARCH = x86_64 ] && host_options+=(--enable-avx2 --enable-avx512bw)
	local user_static_options=(
		--enable-attr
		--target-list="$user_targets"
		--enable-tcg
		--static
		--disable-bpf
		--disable-docs
		--disable-fuse-lseek
		--disable-fdt
	)

	export CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
	export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"
	mkdir -p $srcdir/build
	cd $srcdir/build
	$srcdir/qemu-$pkgver/configure \
		${common_options[*]}			\
		${user_static_options[*]}		\
		${host_options[*]}
	ninja
}

package_qemu-user-static() {
	depends=()

	_install_license_ "$srcdir/qemu-$pkgver/LICENSE" LICENSE

	meson install -C "$srcdir/build" --destdir="$srcdir/install"
	cd "$srcdir/install"

	for t in "${qemu_archs[@]}"; do
		depends+=(qemu-user-static-"$t")
		_pick_ qemu-user-static-"$t" usr/bin/qemu-"$t"
	done
}

binfmt() {
	_name="${pkgname##*-}"

	mkdir -p "$pkgdir"/usr/share/binfmt.d
	cat "$srcdir/binfmt-list" | while read magic mask arch; do
		if [ "$arch" = "$_name" ]; then
			msg2 "Creating binfmt file for $_name"
			cat <<-EOF > "$pkgdir/usr/share/binfmt.d/qemu-$_name"
			name: qemu-$_name
			type: M
			offset: 0
			magic: $magic
			mask: $mask
			interpreter: /usr/bin/qemu-$_name
			flags: OCF
			EOF
			return 0
		fi
	done
}

package_qemu-user-static-aarch64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-alpha() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-arm() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-i386() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-loongarch64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-m68k() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-mips() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-mips64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-mips64el() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-mipsel() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-ppc() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-ppc64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-riscv32() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-riscv64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-s390x() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-sparc() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-sparc64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}

package_qemu-user-static-x86_64() {
	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
	binfmt
}
