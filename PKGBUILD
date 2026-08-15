# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=hdf5
pkgver=2.2.0
pkgrel=1
pkgdesc='HDF5 scientific data model implementation'
url='https://www.hdfgroup.org/solutions/hdf5/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl)
makedepends=(cmake perl flang)
provides=(libhdf5.so libhdf5_hl_f90cstub.so libhdf5_f90cstub.so
	  libhdf5_hl_fortran.so libhdf5_fortran.so libhdf5_tools.so)
source=("https://github.com/HDFGroup/hdf5/releases/download/$pkgver/hdf5.tar.gz")
sha256sums=('1a1ab8209b35586fbc1aa279ba76d102130b95badcb20ca329587219112d8c16')

build() {
	local _enable_fortran=ON
	# flang fails to build the binding on
	# LoongArch
	#	[  286s] LLVM ERROR: Cannot select: 0x7fffef2de8c0: f32 = bf16_to_fp 0x7fffef3a4650, tf_gen.F90:243:5 @[ tf_gen.F90:227:7 ]
	#	...
	#	[  286s] In function: _QMth5_misc_genPverify_real_kind_3
	# RISC-V
	#	flang/lib/Optimizer/CodeGen/Target.cpp:100: not yet implemented:
	#	passing VALUE BIND(C) derived type for this target
	#	when compiling H5VLff.F90.
	case "$CARCH" in
	riscv64|loongarch64)
		_enable_fortran=OFF ;;
	esac

	# TODO: Enable OpenMPI
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DHDF5_BUILD_FORTRAN="$_enable_fortran"	\
		-DHDF5_ONLY_SHARED_LIBS=ON		\
		-DBUILD_TESTING=ON			\

	cmake --build build
}

check() {
	ctest --test-dir build -j "$JOBS"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
