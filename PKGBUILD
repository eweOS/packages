# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=opencsg
pkgver=1.8.2
pkgrel=2
pkgdesc='OpenGL image-based CSG-rendering library'
url='https://opencsg.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl llvm-libs libglvnd)
makedepends=(cmake glad)
provides=(libopencsg.so)
source=("https://www.opencsg.org/OpenCSG-$pkgver.tar.gz")
sha256sums=('5ac5df73b1ad3340dd6705ff90e009f1a946bb9536c21c2263a6f974265664c0')

prepare() {
	cd "OpenCSG-$pkgver"/src
	rm -r glad

	# Re-generate GLAD bindings to include EGL binding logic. Re-visit
	# src/glad/include/glad/gl.h for extensions to include.
	glad --api='gl:compatibility=2.0' --extensions='GL_ARB_depth_clamp,GL_ARB_fragment_program,GL_ARB_framebuffer_object,GL_ARB_occlusion_query,GL_ARB_occlusion_query2,GL_ARB_texture_cube_map,GL_ARB_texture_env_dot3,GL_ARB_texture_non_power_of_two,GL_ARB_texture_rectangle,GL_ARB_vertex_program,GL_EXT_depth_bounds_test,GL_EXT_framebuffer_object,GL_EXT_packed_depth_stencil,GL_EXT_texture_cube_map,GL_EXT_texture_env_dot3,GL_NV_depth_clamp,GL_NV_fill_rectangle,GL_NV_occlusion_query,GL_NV_packed_depth_stencil,GL_NV_texture_rectangle' \
		--out-path glad --reproducible c --loader
	mv glad/src/gl.{c,cpp}
	sed -e 's%<glad/gl.h>%"../include/glad/gl.h"%' -i glad/src/gl.cpp
}

build() {
	# Upstream hacked the generated binding for detection of
	# GL_EXT_texture_rectangle. However, recent drivers should either claim
	# NV_texture_rectangle or ARB_texture_rectangle, so simply define the
	# condition variable for EXT_texture_rectangle as zero.
	CXXFLAGS+=" -DGLAD_GL_EXT_texture_rectangle=0" \
	cmake -S "OpenCSG-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_EXAMPLE=OFF			\
		-DBUILD_SHARED_LIBS=ON			\
		-DOPENGL_USE_GLX=OFF			\
		-DOPENGL_USE_EGL=ON			\
		-DOPENGL_USE_GLES2=ON			\
		-DOPENGL_USE_GLES3=ON			\
		-DOPENGL_USE_OPENGL=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
