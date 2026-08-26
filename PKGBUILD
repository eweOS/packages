# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=openscad
_commit=7e252901dde853ff5f54b90f68a6692926782c5f
_commit_sanitizers_cmake=bcb1fc68616e9645ca5acea2992412606373ab04
pkgver=2026.03.20.${_commit:0:8}
pkgrel=3
pkgdesc='Scripting-based solid 3D CAD modeller'
url='https://openscad.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl lib3mf clipper2 libglvnd glu qt6-base qt6-svg boost-libs
	 llvm-libs cairo double-conversion fontconfig freetype2 glib gmp
	 libhidapi harfbuzz manifold mimalloc mpfr opencsg qscintilla-qt6
	 libspnav libxml2 libzip qt6-5compat qt6-multimedia)
makedepends=(cmake boost cgal eigen git)
options=(!lto)
# 0001: Should be upstreamed. Qt6 OpenGL-related headers automatically imports
#	definitions of the GL-variant used for Qt. However, the application
#	might expect a different variant of GL API, causing definitions
#	conflicts.
#
#	eweOS' Qt6 (for now) is built with OpenGL ES support, while openscad
#	always expect desktop OpenGL, thus is affected by the issue.
source=("git+https://github.com/openscad/openscad.git#commit=$_commit"
	"git+https://github.com/arsenm/sanitizers-cmake.git#commit=$_commit_sanitizers_cmake"
	0001-Avoid-importing-GL-definitions-from-qopengl.h.patch)
sha256sums=('7f19387d821550eeab2a26a1321b5d7ed89ff66617f77a217a50b5e4fedd0c9c'
            'b1381cab9801476fc06ae66b99c036af15309d253560869142990179dadd8760'
            '6571c35343395d941c229a896d94390cb67c6223168402f7ed89c2068bae1b21')

prepare() {
	_patch_ openscad

	cd openscad/submodules
	rm -r sanitizers-cmake
	ln -s "$srcdir"/sanitizers-cmake .
}

build() {
	# Python interpreter is disabled since it seems incompatible with
	# libc++, emitting errors during building like,
	#
	# /usr/bin/../include/c++/v1/__memory/compressed_pair.h:68:57: error: invalid application of 'sizeof' to a function type
	#    68 |                          is_reference<_ToPad>::value || sizeof(_ToPad) == __datasizeof_v<_ToPad>)>
	#       |                                                         ^~~~~~~~~~~~~~
	# /usr/bin/../include/c++/v1/__memory/unique_ptr.h:162:3: note: in instantiation of default argument for '__compressed_pair_padding<deleter_type>' required here
	#   162 |   _LIBCPP_COMPRESSED_PAIR(pointer, __ptr_, deleter_type, __deleter_);
	#       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# /usr/bin/../include/c++/v1/__memory/compressed_pair.h:80:38: note: expanded from macro '_LIBCPP_COMPRESSED_PAIR'
	#    80 |     _LIBCPP_NO_UNIQUE_ADDRESS ::std::__compressed_pair_padding<T2> [ 51%] Building CXX object CMakeFiles/OpenSCADLibInternal.dir/src/gui/AutoUpdater.cc.o
	# _LIBCPP_CONCAT3(__padding2_, __LINE__, _)
	#       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# /root/new_openscad/src/openscad/src/python/pyopenscad.cc:56:19: note: in instantiation of template class 'std::unique_ptr<_object, void (&)(_object *)>' requested here
	#    56 | PyObjectUniquePtr pythonInitDict(nullptr, PyObjectDeleter);
	cmake -S openscad -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DOPENGL_USE_GLX=OFF			\
		-DOPENGL_USE_EGL=ON			\
		-DOPENGL_USE_GLES2=OFF			\
		-DOPENGL_USE_GLES3=OFF			\
		-DOPENGL_USE_OPENGL=ON			\
		-DINFO=ON				\
		-DEXPERIMENTAL=ON			\
		-DENABLE_TESTS=OFF			\
		-DUSE_QT6=ON				\
		-DENABLE_GLX=OFF			\
		-DUSE_GLAD=ON				\
		-DUSE_MIMALLOC=ON			\
		-DUSE_BUILTIN_OPENCSG=OFF		\
		-DUSE_BUILTIN_MANIFOLD=OFF		\
		-DUSE_BUILTIN_CLIPPER2=OFF		\
		-DUSE_CCACHE=OFF			\
		-DENABLE_SPNAV=ON			\
		-DENABLE_HIDAPI=ON			\
		-DENABLE_CGAL=ON			\
		-DENABLE_PYTHON=OFF			\
		-DBUILD_SHARED_LIBS=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
