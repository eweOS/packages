# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=pyside6
pkgname=(pyside6 pyside6-tools shiboken6)
pkgver=6.10.0
pkgrel=4
url='https://doc.qt.io/qtforpython-6/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('(GPL-2.0-only AND (GPL-2.0-only OR GPL-3.0-or-later) AND GPL-3.0-only WITH QT-GPL-exception-1.0) OR LGPL-3.0-only')
makedepends=(python-numpy
             python-setuptools
	     qt6-3d
	     qt6-charts
	     qt6-connectivity
	     qt6-declarative-devel
	     qt6-location
	     qt6-multimedia
	     qt6-networkauth
	     qt6-positioning
	     qt6-quick3d
	     qt6-remoteobjects
	     qt6-remoteobjects-devel
	     qt6-sensors
	     qt6-serialport
	     qt6-shadertools
	     qt6-speech
	     qt6-svg
	     qt6-tools
	     qt6-webchannel
	     qt6-websockets
	     llvm-devel
	     ninja)
# 0001: Should be upstreamed, revert upstream commit that causes headers to be
#	installed in /usr/PySide
# 0002: Should be upstreamed, fix CMake configuration file which sets
#	typesystem directory to /usr/typesystem, even though they're installed
#	in /usr/share/PySide6/typesystems.
source=("https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.10.0-src/pyside-setup-everywhere-src-$pkgver.tar.xz"
	0001-Revert-Modify-headers-installation-for-CMake-builds.patch
	0002-Revert-PySide6-Cleanup-CMake-configuration-files.patch)
sha256sums=('f6e18dc880f59fb6c5c37f9f408971d65642dfc7510a15d794b4a3a8e15fcecc'
            'd16b1f75b77353b33134ac6ae9a6cc41e1692fb498bcd144ec2114b4732b9acf'
            'c3304a522202915a220efc7835ed327d16eaf0615e4c0f956513882a2cef123f')
_srcdir="pyside-setup-everywhere-src-$pkgver"

prepare() {
	_patch_ "$_srcdir"
}

build() {
	local _pylibs="$(pkg-config --libs python3-embed)"
	export PATH="/usr/lib/qt6/bin:$PATH"

	# It's officially recommended to build the packages through setup.py,
	# however, it would vendor too many libraries when built in this way.
	#
	# The CMakeLists.txt compares NO_QT_TOOLS/FORCE_LIMITED_API with
	# literal string "yes"/"no", thus we must inconsistently pass those
	# strings.
	CFLAGS+=" -D_LARGEFILE64_SOURCE" CXXFLAGS+=" -D_LARGEFILE64_SOURCE"
	cmake -S "$_srcdir" -B build \
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_RPATH_USE_ORIGIN=ON	\
		-DCMAKE_SKIP_INSTALL_RPATH=ON		\
		-DBUILD_SHARED_LIBS=ON			\
		-DSHIBOKEN_PYTHON_LIBRARIES="$_pylibs"	\
		-DBUILD_TESTS=OFF			\
		-DNO_QT_TOOLS=yes			\
		-DFORCE_LIMITED_API=no

	PYTHONPATH="$PWD/build/sources" cmake --build build
}

_install_egg_info() {
	local _pythonpath="$(python -c "from sysconfig import get_path; print(get_path('platlib'))")"

	cp -rf "$1" "$pkgdir/$_pythonpath"
}

_do_install_license() {
	_licenses=(GPL-2.0-only.txt
		   GPL-3.0-only.txt
		   LGPL-3.0-only.txt
		   Qt-GPL-exception-1.0.txt)
	for license in "${_licenses[@]}"; do
		_install_license_ "$srcdir/$_srcdir/LICENSES/$license" \
			"$license"
	done
}

package_pyside6() {
	pkgdesc='Python binding for Qt 6.0+ framework'
	depends=(musl llvm-libs python qt6-base qt6-declarative shiboken6
		 python)
	# Dependencies for Python binding shared libraries.
	optdepends=(qt6-3d
		    qt6-charts
		    qt6-connectivity
		    qt6-location
		    qt6-multimedia
		    qt6-networkauth
		    qt6-positioning
		    qt6-quick3d
		    qt6-remoteobjects
		    qt6-remoteobjects-devel
		    qt6-sensors
		    qt6-serialport
		    qt6-shadertools
		    qt6-speech
		    qt6-svg
		    qt6-tools
		    qt6-webchannel
		    qt6-websockets)

	DESTDIR="$pkgdir" cmake --install build/sources/pyside6

	cd "$_srcdir"
	PATH="/usr/lib/qt6/bin:$PATH" python setup.py egg_info \
		--build-type pyside6
	_install_egg_info PySide6.egg-info
	_do_install_license
}

package_pyside6-tools() {
	pkgdesc='Tools for PySide 6'
	depends=(pyside6 python)

	DESTDIR="$pkgdir" cmake --install build/sources/pyside-tools
	_do_install_license
}

package_shiboken6() {
	pkgdesc='Generate CPython bindings from C/C++ headers'
	depends=(qt6-base clang libxml2 libxslt llvm-libs musl python)

	DESTDIR="$pkgdir" cmake --install build/sources/shiboken6

	cd "$_srcdir"
	PATH="/usr/lib/qt6/bin:$PATH" python setup.py egg_info \
		--build-type shiboken6
	PATH="/usr/lib/qt6/bin:$PATH" python setup.py egg_info \
		--build-type shiboken6-generator
	_install_egg_info shiboken6.egg-info
	_install_egg_info shiboken6_generator.egg-info

	_do_install_license
}
