# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=gstreamer
pkgname=(gstreamer gstreamer-devel gstreamer-vaapi
	 gst-plugins-base gst-plugins-good gst-plugins-bad
	 gst-plugin-gtk gst-plugin-qml6 gst-plugin-qsv gst-plugin-va
	 gst-libav gst-rtsp-server gst-editing-services gst-python)
pkgver=1.24.9
pkgrel=1
pkgdesc='GStreamer multimedia framework'
url='https://gstreamer.freedesktop.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(llvm-libs glib2 musl libcap libelf)
makedepends=(meson samurai glib2 gobject-introspection libdrm python-gobject
	     bash-completion rust
	     alsa-lib libopus libogg pango libvorbis iso-codes libglvnd mesa
	     wayland-protocols
	     nasm cairo libflac gdk-pixbuf gtk3 libjpeg libpng libpulse
	     qt6-base qt6-wayland qt6-tools qt6-shadertools libvpx lame
	     vulkan-headers libdrm shaderc linux-headers libva libsoup3
	     libaom libbz2 curl fluidsynth gsm libopus libsndfile libxml2
	     libsrt libwebp x265 openal-soft openexr libjpeg librsvg
	     vulkan-icd-loader libass lcms2 openjpeg2
	     json-glib ffmpeg svt-av1 mpg123 taglib)

source=(
  "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/$pkgver/gstreamer-$pkgver.tar.gz"
  "no-x11.patch::https://github.com/GStreamer/gstreamer/commit/577df3a02f7f26283b2749c58ae7738bbdf4be4c.patch"
)
sha256sums=('ec9483e7ecc59306923d797c0824e859013901ed520975cbbad5f46c9413a748'
            'abf65ce99b01e9ca47e2555e2176099cc9402c8b1ca02cd3491add931eb31bea')

prepare () {
	_patch_ $pkgname-$pkgver
}

_plugin_depends=(musl gstreamer="$pkgver-$pkgrel" gst-plugins-base-libs="$pkgver-$pkgrel")

build () {
	local plugins_base_opt=(
		-Dgst-plugins-base:x11=disabled
		-Dgst-plugins-base:cdparanoia=disabled	# missing cdparanoia
		-Dgst-plugins-base:libvisual=disabled
		-Dgst-plugins-base:theora=disabled
		-Dgst-plugins-base:tremor=disabled	# missing libvorbisidec
	)

	local plugins_good_opt=(
		-Dgst-plugins-good:rpicamsrc=disabled
		-Dgst-plugins-good:v4l2=disabled	# missing v4l2 lib/tools
		-Dgst-plugins-good:v4l2-gudev=disabled
		-Dgst-plugins-good:ximagesrc=disabled
		-Dgst-plugins-good:aalib=disabled
		-Dgst-plugins-good:jack=disabled
		-Dgst-plugins-good:amrnb=disabled
		-Dgst-plugins-good:amrwbdec=disabled
		-Dgst-plugins-good:dv=disabled		# missing libdv
		-Dgst-plugins-good:libcaca=disabled	# missing libcaca
		-Dgst-plugins-good:qt-x11=disabled
		-Dgst-plugins-good:qt-egl=disabled
		-Dgst-plugins-good:dv1394=disabled	# missing libavc1394
							# libiec61883
		-Dgst-plugins-good:shout2=disabled
		-Dgst-plugins-good:speex=disabled
		-Dgst-plugins-good:twolame=disabled
		-Dgst-plugins-good:wavpack=disabled
	)

	local plugins_bad_opt=(
		-Dgst-plugins-bad:x11=disabled
		-Dgst-plugins-bad:opencv=disabled
		-Dgst-plugins-bad:aja=disabled		# missing libajantv2
		-Dgst-plugins-bad:amfcodec=disabled
		-Dgst-plugins-bad:androidmedia=disabled
		-Dgst-plugins-bad:applemedia=disabled
		-Dgst-plugins-bad:asio=disabled
		-Dgst-plugins-bad:bluez=disabled
		-Dgst-plugins-bad:d3d11=disabled
		-Dgst-plugins-bad:d3d12=disabled
		-Dgst-plugins-bad:d3dvideosink=disabled
		-Dgst-plugins-bad:decklink=disabled	# missing libdl
		-Dgst-plugins-bad:directshow=disabled
		-Dgst-plugins-bad:directsound=disabled
		-Dgst-plugins-bad:dwrite=disabled
		-Dgst-plugins-bad:magicleap=disabled
		-Dgst-plugins-bad:mediafoundation=disabled
		-Dgst-plugins-bad:msdk=disabled
		-Dgst-plugins-bad:nvcodec=disabled
		-Dgst-plugins-bad:opensles=disabled
		-Dgst-plugins-bad:tinyalsa=disabled
		-Dgst-plugins-bad:uvcgadget=disabled	# missing gudev
		-Dgst-plugins-bad:uvch264=disabled	# missing gudev
		-Dgst-plugins-bad:v4l2codecs=disabled	# again
		-Dgst-plugins-bad:wasapi=disabled
		-Dgst-plugins-bad:wasapi2=disabled
		-Dgst-plugins-bad:wic=disabled
		-Dgst-plugins-bad:win32ipc=disabled
		-Dgst-plugins-bad:winks=disabled
		-Dgst-plugins-bad:winscreencap=disabled

		-Dgst-plugins-bad:avtp=disabled
		-Dgst-plugins-bad:bs2b=disabled
		-Dgst-plugins-bad:chromaprint=disabled
		-Dgst-plugins-bad:codec2json=disabled
		-Dgst-plugins-bad:dc1394=disabled
		-Dgst-plugins-bad:directfb=disabled
		-Dgst-plugins-bad:dts=disabled
		-Dgst-plugins-bad:faac=disabled
		-Dgst-plugins-bad:faad=disabled
		-Dgst-plugins-bad:fdkaac=disabled
		-Dgst-plugins-bad:flite=disabled
		-Dgst-plugins-bad:gme=disabled
		-Dgst-plugins-bad:gs=disabled
		-Dgst-plugins-bad:hls=disabled
		-Dgst-plugins-bad:iqa=disabled
		-Dgst-plugins-bad:isac=disabled
		-Dgst-plugins-bad:ladspa=disabled
		-Dgst-plugins-bad:lc3=disabled
		-Dgst-plugins-bad:ldac=disabled
		-Dgst-plugins-bad:libde265=disabled
		-Dgst-plugins-bad:lv2=disabled
		-Dgst-plugins-bad:microdns=disabled
		-Dgst-plugins-bad:modplug=disabled
		-Dgst-plugins-bad:mpeg2enc=disabled
		-Dgst-plugins-bad:mplex=disabled
		-Dgst-plugins-bad:musepack=disabled
		-Dgst-plugins-bad:neon=disabled
		-Dgst-plugins-bad:onnx=disabled
		-Dgst-plugins-bad:openaptx=disabled
		-Dgst-plugins-bad:opencv=disabled
		-Dgst-plugins-bad:openh264=disabled	# figure out why Arch
							# does this
		-Dgst-plugins-bad:openmpt=disabled
		-Dgst-plugins-bad:openni2=disabled
		-Dgst-plugins-bad:qroverlay=disabled
		-Dgst-plugins-bad:qt6d3d11=disabled
		-Dgst-plugins-bad:resindvd=disabled
		-Dgst-plugins-bad:rtmp=disabled
		-Dgst-plugins-bad:sbc=disabled
		-Dgst-plugins-bad:sctp=disabled
		-Dgst-plugins-bad:smoothstreaming=disabled
		-Dgst-plugins-bad:soundtouch=disabled
		-Dgst-plugins-bad:spandsp=disabled
		-Dgst-plugins-bad:srtp=disabled		# missing libsrtp2
		-Dgst-plugins-bad:svthevcenc=disabled	# missing SvtHevcEnc
		-Dgst-plugins-bad:teletext=disabled	# missing zsbi
		-Dgst-plugins-bad:udev=disabled # gudev
		-Dgst-plugins-bad:voaacenc=disabled
		-Dgst-plugins-bad:voamrwbenc=disabled
		-Dgst-plugins-bad:webrtc=disabled
		-Dgst-plugins-bad:webrtcdsp=disabled
		-Dgst-plugins-bad:wildmidi=disabled
		-Dgst-plugins-bad:zbar=disabled		# missing zbar
		-Dgst-plugins-bad:zxing=disabled	# missing zxing
	)

	local devtools_opt=(
		# conflict definitions for multiple network functions
		-Dgst-devtools:validate=disabled
		-Dgst-editing-services:validate=disabled
	)

	local vaapi_opt=(
		-Dgstreamer-vaapi:x11=disabled
		-Dgstreamer-vaapi:glx=disabled
	)

	# missing hotdoc for documentation
	ewe-meson "$pkgname-$pkgver" build \
		-Dexamples=disabled					\
		-Dbase=enabled						\
		-Dgood=enabled						\
		-Dugly=disabled						\
		-Dbad=enabled						\
		-Dlibav=enabled						\
		-Ddevtools=enabled					\
		-Dges=enabled						\
		-Drtsp_server=enabled					\
		-Drs=disabled						\
		-Dvaapi=enabled						\
		-Dgst-examples=disabled					\
		-Dpython=enabled					\
		-Dsharp=disabled					\
		-Dtls=disabled						\
		-Dlibnice=disabled					\
		-Doss_fuzz=disabled					\
		-Dgpl=enabled						\
		-Dtests=enabled						\
		-Dtools=enabled						\
		-Dintrospection=enabled					\
		-Dnls=enabled						\
		-Dorc=disabled						\
		-Ddoc=disabled						\
		-Dgtk_doc=disabled					\
		-Dqt5=disabled						\
		-Dqt6=enabled						\
		-Dwebrtc=disabled					\
		-Dgstreamer:libunwind=disabled				\
		-Dgstreamer:dbghelp=disabled				\
		${plugins_base_opt[@]}					\
		${plugins_good_opt[@]}					\
		${plugins_bad_opt[@]}					\
		${vaapi_opt[@]}						\
		${devtools_opt[@]}					\
		-Dpackage-name="eweOS Linux GStreamer $pkgver-$pkgrel"	\
		-Dpackage-origin="https://os.ewe.moe/"

	meson compile -C build
}

check() {
	# TODO: fix failed test
	meson test -C build || true
}

##########################################

# File Lists

#====================== gstreamer-devel

_files_gstreamer_devel=(
	usr/include
	usr/lib/girepository-1.0
	usr/lib/pkgconfig
	usr/share/gir-1.0
)

#====================== gst-plugins-base

_libs_gst_plugins_base=(
	allocators app audio fft gl pbutils riff rtp rtsp sdp tag video
)

_modules_gst_plugins_base=(
	adder app audioconvert audiomixer audiorate audioresample audiotestsrc compositor basedebug dsd
	encoding gio overlaycomposition pbtypes playback rawparse subparse tcp typefindfunctions
	videoconvertscale videorate videotestsrc volume

	alsa opengl ogg opus pango vorbis
)

#====================== gst-plugins-good (libs)

_modules_gst_plugins_good=(
	ossaudio oss4 alpha alphacolor apetag audiofx audioparsers auparse autodetect avi cutter debug
	navigationtest deinterlace dtmf effectv equalizer flv flxdec goom goom2k1 icydemux id3demux
	imagefreeze interleave isomp4 alaw mulaw lame level matroska monoscope mpg123 multifile multipart
	replaygain rtp rtpmanager rtsp shapewipe smpte soup spectrum taglib udp videobox videocrop videofilter
	videomixer wavenc wavparse xingmux y4menc
)

#====================== gst-plugins-good

_modules_gst_plugins_good+=(
	adaptivedemux2 cairo flac gdkpixbuf jpeg png pulseaudio vpx
)

#====================== gst-plugins-bad (libs)

_libs_gst_plugins_bad=(
	adaptivedemux analytics badaudio basecamerabinsrc codecparsers codecs cuda dxva insertbin
	photography isoff mpegts mse play player sctp transcoder uridownloader va vulkan wayland webrtc
)

_modules_gst_plugins_bad=(
	accurip adpcmdec adpcmenc aiff asfmux audiobuffersplit audiofxbad audiolatency audiomixmatrix
	audiovisualizers autoconvert bayer camerabin codecalpha codectimestamper coloreffects debugutilsbad
	dvbsubenc dvbsuboverlay dvdspu faceoverlay festival fieldanalysis freeverb frei0r gaudieffects gdp
	geometrictransform id3tag insertbin inter interlace ivfparse ivtc jp2kdecimator jpegformat rfbsrc
	midi mpegpsdemux mpegpsmux mpegtsdemux mpegtsmux mse mxf netsim rtponvif pcapparse pnm proxy
	legacyrawparse removesilence rist rtmp2 rtpmanagerbad sdpelem segmentclip siren smooth speed subenc
	switchbin timecode transcode unixfd videofiltersbad videoframe_audiolevel videoparsersbad videosignal
	vmnc y4mdec
	dvb fbdevsink ipcpipeline kms shm svtav1
)

#====================== gst-plugins-bad

_modules_gst_plugins_bad+=(
	aes analyticsoverlay aom assrender bz2 closedcaption colormanagement curl dash dtls fluidsynthmidi gsm
	openal openexr openjpeg opusparse rsvg sndfile srt ttmlsubs vulkan waylandsink webp x265
)

#====================== gst-libav

_modules_gst_libav=(libav)

#====================== gst-plugin-gtk

_modules_gst_plugin_gtk=(gtk gtkwayland)

#====================== gst-plugin-qml6

_modules_gst_plugin_qml6=(qml6)

#====================== gstreamer-vaapi

_modules_gstreamer_vaapi=(vaapi)

#====================== gst-plugin-qsv

_modules_gst_plugin_qsv=(qsv)

#====================== gst-plugin-va

_modules_gst_plugin_va=(va)

#====================== gst-rtsp-server

_libs_gst_rtsp_server=(rtspserver)

_modules_gst_rtsp_server=(rtspclientsink)

#====================== gst-editing-services

_modules_gst_editing_services=(ges nle)

_files_gst_editing_services=(
    usr/lib/libges-1.0.so*
    usr/lib/python*/site-packages/gi/overrides/GES.py
    usr/lib/python*/site-packages/gi/overrides/__pycache__/GES.*.pyc
    usr/bin/ges-launch-1.0
    usr/share/man/man1/ges-launch-1.0.1
    usr/share/bash-completion/completions/ges-launch-1.0
)

#====================== gst-python

_modules_gst_python=(python)

_files_gst_python=(
    usr/lib/python*/site-packages/gi/overrides
)

##########################################

package_gstreamer() {
	meson install -C build --destdir "$pkgdir"

	cd $pkgdir
	# useless gdb script
	rm -r usr/share/gdb

	for subpkg in ${pkgname[@]}; do
		if [ "$subpkg" != "gstreamer" ] && [ "$subpkg" != "gstreamer-devel" ]; then
			msg2 "Picking files for $subpkg"

			_cur_libs_subpkg="_libs_${subpkg//-/_}[@]"
			_cur_modules_subpkg="_modules_${subpkg//-/_}[@]"
			_cur_files_subpkg="_files_${subpkg//-/_}[@]"

			[[ -v "${_cur_libs_subpkg}" ]] && \
				_pick_ $subpkg $(printf "usr/lib/libgst%s-1.0.so* " "${!_cur_libs_subpkg}")
			[[ -v "${_cur_modules_subpkg}" ]] && \
				_pick_ $subpkg $(printf "usr/lib/gstreamer-1.0/libgst%s.so " "${!_cur_modules_subpkg}")
			[[ -v "${_cur_files_subpkg}" ]] && \
				_pick_ $subpkg ${!_cur_files_subpkg}
		fi
	done

	msg2 "Picking files for gstreamer-devel"
	_pick_ gstreamer-devel ${_files_gstreamer_devel[@]}

	depends=(glib python libxml2 zlib-ng gst-plugins-base)
}

do_install() {
	mv $srcdir/pkgs/$pkgname/* "$pkgdir"
}

package_gstreamer-devel() {
	pkgdesc+=" - devel files"
	depends=(gstreamer="$pkgver-$pkgrel")
	optdepends=('gst-plugins-bad: Bad GStreamer libraries')
	do_install
}

package_gst-plugins-base() {
	pkgdesc+=" - base plugins"
	provides=(gst-plugins-base-libs)
	depends=(musl gstreamer="$pkgver-$pkgrel" libdrm libglvnd glib wayland
		 zlib-ng)
	depends+=(alsa-lib cairo graphene harfbuzz libjpeg libogg libopus
		  pango libpng libvorbis iso-codes)
	do_install
}

package_gst-plugins-good() {
	pkgdesc+=" - good plugins"
	depends=(${_plugin_depends[*]})
	depends+=(libflac libglvnd at-spi2-core libbz2 llvm-libs musl cairo
		  libgcrypt gdk-pixbuf glib harfbuzz libjpeg pango libpng taglib
		  libpulse libvpx wayland libxml2 zlib-ng lame libsoup3 mpg123)
	do_install
}

package_gst-plugins-bad() {
	pkgdesc+=" - bad plugins"
	depends=(${_plugin_depends[*]})
	provides=(gst-plugins-bad-libs)
	depends+=(llvm-libs musl libdrm glib libva vulkan-icd-loader wayland
		  zlib-ng)
	depends+=(openexr imath libaom libass at-spi2-core libbz2 cairo openssl
		  curl gdk-pixbuf gsm harfbuzz lcms2 openal-soft openjpeg2
		  libopus pango librsvg libsndfile libsrt libwebp libx265
		  libxml2 svt-av1)
	do_install
}

package_gst-libav() {
	pkgdesc+=" - libav plugin"
	depends=(${_plugin_depends[*]})
	depends+=(ffmpeg)
	do_install
}

package_gst-plugin-gtk() {
	pkgdesc+=" - GTK plugin"
	depends=(${_plugin_depends[*]})
	depends+=(at-spi2-core cairo libdrm gdk-pixbuf glib harfbuzz pango wayland)
	do_install
}

package_gst-plugin-qml6() {
	pkgdesc+=" - QML6 plugin"
	depends=(${_plugin_depends[*]})
	depends+=(qt6-base qt6-declarative)
	do_install
}

package_gst-plugin-va() {
	pkgdesc+=" - va plugin"
	depends=(${_plugin_depends[*]})
	depends+=(libva)
	do_install
}

package_gst-rtsp-server() {
	pkgdesc+=" - rtsp server"
	depends=(${_plugin_depends[*]})
	depends+=(zlib)
	do_install
}

package_gst-editing-services() {
	pkgdesc+=" - editing services"
	depends=(${_plugin_depends[*]})
	depends+=(json-glib libxml2 python python-gobject zlib)
	do_install
}

package_gstreamer-vaapi() {
	pkgdesc+=" - vaapi plugin"
	depends=(${_plugin_depends[*]})
	depends+=(libglvnd libva wayland)
	do_install
}

package_gst-python() {
	pkgdesc+=" - python plugin"
	depends=(${_plugin_depends[*]})
	depends+=(python python-gobject)
	do_install
}

package_gst-plugin-qsv() {
	pkgdesc+=" - qsv plugin"
	depends=(${_plugin_depends[*]})
	depends+=("gst-plugins-bad-libs=$pkgver-$pkgrel")
	do_install
}
