
pkgbase=linux-tools
pkgname=(bpftool tmon perf)
groups=($pkgbase)
pkgver=6.19.11
pkgrel=3
pkgdesc='Linux kernel tools'
license=(GPL-2.0-only)
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.kernel.org'
options=(!strip !lto)
# makedepends=(
#   linux-headers
#   # kernel source
#   asciidoc xmlto
#   # bpftool
#   # TODO: dynamically link libbpf
#   readline zlib libcap libelf python-docutils
#   # tmon
#   ncurses
#   # perf
#   libtraceevent libpfm libelf capstone python llvm-devel xz libnuma slang
#   llvm-libs zlib-ng zstd
# )
# HACK: list these dependencies here so that OBS can read them
# Make sure to update both here and `makedepends=` comments above and below
# when modifying dependencies
# Note that OBS upstream currently only supports _x86_64 (and _i686) suffix,
# though.
makedepends=(linux-headers asciidoc xmlto readline zlib libcap libelf python-docutils ncurses
             libtraceevent libpfm libelf capstone python llvm-devel xz libnuma
             slang llvm-libs zlib-ng zstd)
makedepends_x86_64=(libnl libcap)
source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz
        0001-bpftool-disable-bpf_jit_disasm.patch)  # downstream
sha256sums=('20039d7b6b256c08be2f8fac43c3ff9a620308c703c643cf2f80c3910b9bd59b'
            'bd265ad84c3cc2e468d66582d245134cdc6c427562ae2f34ea948a4ad7d1e1d7')

case $CARCH in
x86_64)
  pkgname+=(intel-speed-select kcpuid turbostat x86_energy_perf_policy)
  # makedepends+=(
  #   # intel-speed-select
  #   libnl
  #   # turbostat
  #   libcap
  # )
  ;;
esac

_perfargs=(
  prefix=/usr
  lib=lib
  perfexecdir=lib/perf
)

prepare() {
  _patch_ linux-$pkgver
}

build() {
  _linux="$srcdir"/linux-$pkgver
  export CC=cc HOSTCC=cc

  # TODO:
  #  enable babeltrace
  msg2 'perf'
  cd "$_linux"/tools/perf
  # Invoke Makefile.perf directly, or some make arguments may be stripped by
  # the wrapper Makefile.
  make -f Makefile.perf "${_perfargs[@]}"

  msg2 'bpftool'
  cd "$_linux"/tools/bpf
  # doesn't compile when we don't first compile bpftool in its own directory and
  # man pages require to be also launch from the subdirectory
  make -C bpftool all doc
  # runqslower requires kernel binary path to build
  make -W runqslower

  msg2 'tmon'
  cd "$_linux"/tools/thermal/tmon
  make

  case $CARCH in
  x86_64)
    msg2 'intel-speed-select'
    cd "$_linux"/tools/power/x86/intel-speed-select
    make

    msg2 'kcpuid'
    cd "$_linux"/tools/arch/x86/kcpuid
    make

    msg2 'turbostat'
    cd "$_linux"/tools/power/x86/turbostat
    make

    msg2 'x86_energy_perf_policy'
    cd "$_linux"/tools/power/x86/x86_energy_perf_policy
    make
    ;;
  esac
}

package_bpftool() {
  pkgdesc='Inspection and simple manipulation of eBPF programs and maps'
  depends=(musl readline zlib libelf libcap zstd llvm-libs) # sframe not in LLVM yet

  cd linux-$pkgver/tools/bpf
  # skip runsqlower until enabled in build
  make -W runqslower_install install prefix=/usr DESTDIR="$pkgdir"
  # fix bpftool hard written path
  mv "$pkgdir"/usr/sbin/bpftool "$pkgdir"/usr/bin/bpftool
  rmdir "$pkgdir"/usr/sbin
  # install man pages
  make -C bpftool doc-install prefix=/usr/share DESTDIR="$pkgdir"
}

package_tmon() {
  pkgdesc='Monitoring and testing tool for Linux kernel thermal subsystem'
  depends=(musl ncurses)

  cd linux-$pkgver/tools/thermal/tmon
  make install INSTALL_ROOT="$pkgdir"
}

# x86_64

package_intel-speed-select() {
  pkgdesc='Configuration tool for the Intel(R) Speed Select Technology'
  depends=(musl libnl)

  cd linux-$pkgver/tools/power/x86/intel-speed-select
  make install DESTDIR="$pkgdir"
}

package_kcpuid() {
  pkgdesc='Kernel tool for various CPU debug outputs'
  depends=(musl)

  make BINDIR=/usr/bin HWDATADIR=/usr/share/misc DESTDIR="$pkgdir" \
    -C linux-$pkgver/tools/arch/x86/kcpuid install
}

package_turbostat() {
  pkgdesc='Report processor frequency and idle statistics'
  depends=(musl libcap)

  cd linux-$pkgver/tools/power/x86/turbostat
  make install DESTDIR="$pkgdir"
}

package_x86_energy_perf_policy() {
  pkgdesc='Read or write MSR_IA32_ENERGY_PERF_BIAS'
  depends=(musl)

  cd linux-$pkgver/tools/power/x86/x86_energy_perf_policy
  install -Dm755 x86_energy_perf_policy "$pkgdir"/usr/bin/x86_energy_perf_policy
  install -Dm644 x86_energy_perf_policy.8 "$pkgdir"/usr/share/man/man8/x86_energy_perf_policy.8
}

package_perf() {
  pkgdesc='Linux performance auditing tool'
  depends=(musl libtraceevent libpfm libelf capstone python llvm xz libnuma
           slang llvm-libs zlib-ng zstd)

  cd linux-$pkgver/tools/perf
  export CC=cc HOSTCC=cc

  make -f Makefile.perf install DESTDIR="$pkgdir" "${_perfargs[@]}"
}
