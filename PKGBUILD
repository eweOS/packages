# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=qemu
pkgname=(qemu-common
	 qemu-tools
	 qemu-system-{aarch64,alpha,arm,i386,loongarch64,m68k,mips,mips64}
	 qemu-system-{mips64el,mipsel,ppc,ppc64,riscv32,riscv64,s390x}
	 qemu-system-{sparc,sparc64,x86_64}
	 qemu-audio-{alsa,pipewire,sdl}
	 qemu-block-{curl,dmg}
	 qemu-hw-display-virtio-{gpu-gl,gpu-pci-gl,gpu-pci,gpu,vga-gl,vga}
	 qemu-hw-s390x-virtio-gpu-ccw
	 qemu-ui-{curses,egl-headless,gtk,opengl,sdl}
	 qemu-hw-usb-host
	 qemu-tests
	 qemu-guest-agent
	) # TODO: split firmwares
pkgver=9.1.0
pkgrel=1
pkgdesc='A generic and open source machine emulator and virtualizer.'
url='https://www.qemu.org/'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0 BSD-2-Clause BSD-3-Clause FSFAP GPL-1.0-or-later
	 GPL-2.0-only GPL-2,0-or-later GPL-2.0-or-later-WITH-GCC-exception-2.0
	 LGPL-2.0-only LGPL-2.0-or-later MIT CC-BY-3.0)
makedepends=(alsa-lib bzip2 cairo curl dtc fuse3 gtk3 glib ncurses pipewire
	     pixman json-c libaio libgcrypt libgpg-error libpng libsasl
	     libseccomp libslirp libusb libudev linux-headers sdl2 libxkbcommon
	     virglrenderer vulkan-icd-loader pcre2 libffi openssl zstd libepoxy
	     meson ninja)
qemu_archs=(aarch64 alpha arm i386 loongarch64 m68k mips mips64 mips64el
	    mipsel ppc ppc64 riscv32 riscv64 s390x sparc sparc64 x86_64)
source=("https://download.qemu.org/qemu-$pkgver.tar.xz")
sha256sums=('816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834')
# TODO: enable (static) user targets

system_targets=""
for t in ${qemu_archs[*]}; do
	system_targets="$t-softmmu,$system_targets"
done
system_targets=${system_targets:0:-1}

F_QEMU_TOOLS=(
	elf2dmp
	qemu-edid
	qemu-img
	qemu-io
	qemu-keymap
	qemu-nbd
	qemu-pr-helper
	qemu-storage-daemon
)

build () {
	local common_options=(
		--prefix=/usr
		--enable-lto
	)
	local host_options=()
	[ $CARCH = x86_64 ] && host_options+=(--enable-avx2 --enable-avx512bw)
	local system_options=(
		--enable-modules
		--target-list=$system_targets
		--enable-tools
		--disable-hexagon-idef-parser	# TODO: need cpp?
		--enable-alsa
		--enable-attr
		--disable-auth-pam
		--disable-blkio
		--enable-bochs
		--disable-bpf
		--disable-brlapi
		--enable-bzip2
		--disable-canokey
		--disable-cap-ng
		--disable-capstone
		--enable-cloop
		--disable-coreaudio
		--enable-crypto-afalg
		--enable-curl
		--enable-curses
		--disable-dbus-display
		--enable-dmg
		--disable-docs
		--disable-dsound
		--enable-fuse
		--enable-fuse-lseek
		--enable-gcrypt
		--enable-gettext
		--enable-gio
		--disable-glusterfs
		--disable-gnutls
		--enable-gtk
		--enable-guest-agent
		--disable-guest-agent-msi
		--disable-hv-balloon
		--enable-iconv
		--disable-jack
		--enable-keyring
		--enable-kvm
		--disable-l2tpv3
		--disable-libdaxctl
		--disable-libdw
		--disable-libiscsi
		--disable-libkeyutils
		--disable-libnfs
		--disable-libpmem
		--disable-libssh
		--enable-libudev
		--enable-libusb
		--enable-libvduse
		--enable-linux-aio
		--disable-linux-io-uring
		--disable-lzfse
		--disable-lzo
		--disable-malloc-trim
		--enable-membarrier
		--enable-modules
		--enable-multiprocess
		--disable-netmap
		--disable-nettle
		--disable-numa
		--disable-nvmm
		--enable-opengl
		--disable-oss
		--disable-pa
		--enable-parallels
		--enable-pipewire
		--enable-pixman
		--enable-plugins
		--enable-png
		--enable-qcow1
		--enable-qed
		--disable-rbd
		--disable-rdma
		--enable-replication
		--disable-rutabaga-gfx
		--enable-sdl
		--disable-sdl-image
		--enable-seccomp
		--disable-selinux
		--enable-slirp
		--disable-slirp-smbd
		--disable-smartcard
		--disable-snappy
		--disable-sndio
		--disable-sparse
		--disable-spice
		--enable-tcg
		--enable-tpm
		--disable-u2f
		--disable-usb-redir
		--disable-vde
		--enable-vdi
		--disable-vduse-blk-export
		--disable-vfio-user-server
		--enable-vhdx
		--enable-vhost-crypto
		--enable-vhost-kernel
		--enable-vhost-net
		--enable-vhost-user
		--enable-vhost-user-blk-server
		--enable-vhost-vdpa
		--enable-virtfs
		--disable-virtfs-proxy-helper
		--enable-vmdk
		--enable-vnc
		--enable-vnc-jpeg
		--enable-vnc-sasl
		--enable-vpc
		--disable-vte
		--enable-vvfat
		--disable-whpx
		--disable-xen
		--enable-xkbcommon
		--enable-zstd
	)

	export LDFLAGS="$LDFLAGS -Wl,-z,stack-size=$((1024 * 1024))"
	mkdir -p $srcdir/build
	cd $srcdir/build
	$srcdir/qemu-$pkgver/configure \
		${common_options[*]}			\
		${system_options[*]}			\
		${host_options[*]}
	ninja
}

qemu_system_dep=(pixman libpng zlib-ng libjpeg libsasl libudev libseccomp
		 glib zstd libslirp libgcrypt libgpg-error fuse3 libaio libffi
		 pcre2 libfdt qemu-common=$pkgver-$pkgrel)

package_qemu-common() {
	_install_license_ $srcdir/qemu-$pkgver/LICENSE LICENSE
	_install_license_ $srcdir/qemu-$pkgver/tests/uefi-test-tools/LICENSE \
		BSD-3-Caluse
	_install_license_ $srcdir/qemu-$pkgver/pc-bios/edk2-licenses.txt \
		edk2-license

	meson install -C build --destdir=$pkgdir

	rm -r $pkgdir/var

	# System Emulators
	cd $pkgdir
	for t in ${qemu_archs[*]}; do
		_pick_ qemu-system-$t usr/bin/qemu-system-$t
	done

	# qemu-tools
	for f in ${F_QEMU_TOOLS[*]}; do
		_pick_ qemu-tools usr/bin/$f
	done

	# qemu-guest-agent
	_pick_ qemu-guest-agent usr/bin/qemu-ga

	local qmod=usr/lib/qemu

	# qemu-tests
	_pick_ qemu-tests $qmod/accel-qtest-*.so

	# audio backends
	_pick_ qemu-audio-alsa $qmod/audio-alsa.so
	_pick_ qemu-audio-pipewire $qmod/audio-pipewire.so
	_pick_ qemu-audio-sdl $qmod/audio-sdl.so

	# blockdev backends
	_pick_ qemu-block-curl $qmod/block-curl.so
	_pick_ qemu-block-dmg $qmod/block-dmg-*.so

	# UI backends
	_pick_ qemu-ui-curses $qmod/ui-curses.so
	_pick_ qemu-ui-egl-headless $qmod/ui-egl-headless.so
	_pick_ qemu-ui-gtk $qmod/ui-gtk.so
	_pick_ qemu-ui-opengl $qmod/ui-opengl.so
	_pick_ qemu-ui-sdl $qmod/ui-sdl.so

	# hw-display
	_pick_ qemu-hw-display-virtio-gpu-gl $qmod/hw-display-virtio-gpu-gl.so
	_pick_ qemu-hw-display-virtio-gpu-pci-gl $qmod/hw-display-virtio-gpu-pci-gl.so
	_pick_ qemu-hw-display-virtio-gpu-pci $qmod/hw-display-virtio-gpu-pci.so
	_pick_ qemu-hw-display-virtio-gpu $qmod/hw-display-virtio-gpu.so
	_pick_ qemu-hw-display-virtio-vga-gl $qmod/hw-display-virtio-vga-gl.so
	_pick_ qemu-hw-display-virtio-vga $qmod/hw-display-virtio-vga.so

	_pick_ qemu-hw-s390x-virtio-gpu-ccw $qmod/hw-s390x-virtio-gpu-ccw.so	

	# USB backends
	_pick_ qemu-hw-usb-host $qmod/hw-usb-host.so
}

package_qemu-system-aarch64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-alpha() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-arm() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-i386() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-loongarch64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-m68k() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-mips() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-mips64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-mips64el() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-mipsel() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-ppc() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-ppc64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-riscv32() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-riscv64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-s390x() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-sparc() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-sparc64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-system-x86_64() {
depends=(${qemu_system_dep[*]})

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-tools() {
depends=(glib curl pcre2 openssl zstd zlib-ng libudev libgcrypt libgpg-error libaio libxkbcommon fuse3 qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

# TODO: check depends
package_qemu-guest-agent() {
depends=(glib curl pcre2 openssl zstd zlib-ng libudev libgcrypt libgpg-error libaio libxkbcommon fuse3 qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-tests() {
depends=(qemu-common=$pkgver-$pkgrel)
	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-audio-alsa() {
depends=(alsa-lib qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-audio-pipewire() {
depends=(pipewire qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-audio-sdl() {
depends=(sdl2 qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-block-curl() {
depends=(curl qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-block-dmg() {
depends=(libbz2 qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-ui-curses() {
depends=(glib ncurses qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-ui-egl-headless() {
depends=(libepoxy pixman qemu-common=$pkgver-$pkgrel
	 qemu-ui-opengl=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-ui-gtk() {
depends=(cairo libepoxy gtk3 glib pixman qemu-common=$pkgver-$pkgrel
	 qemu-ui-opengl=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-ui-opengl() {
depends=(libepoxy mesa pixman qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-ui-sdl() {
depends=(sdl2 glib pixman qemu-common=$pkgver-$pkgrel
	 qemu-ui-opengl=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-gpu-gl() {
depends=(virglrenderer qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-gpu-pci-gl() {
depends=(qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-gpu-pci() {
depends=(qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-gpu() {
depends=(pixman qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-vga-gl() {
depends=(qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-display-virtio-vga() {
depends=(qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-s390x-virtio-gpu-ccw() {
depends=(qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}

package_qemu-hw-usb-host() {
depends=(libusb qemu-common=$pkgver-$pkgrel)

	mv $srcdir/pkgs/$pkgname/* $pkgdir
}
