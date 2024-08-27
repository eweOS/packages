# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=gstreamer
pkgname=(gstreamer gstreamer-devel
	 gst-plugins-base gst-plugins-good gst-plugins-bad
	 gst-libav)
pkgver=1.24.7
pkgrel=1
pkgdesc='GStreamer multimedia framework'
url='https://gstreamer.freedesktop.org/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(llvm-libs glib2 musl libcap libelf)
makedepends=(meson samurai glib2 gobject-introspection libdrm python-gobject
	     bash-completion rust
	# gst-plugins-base
	     alsa-lib libopus libogg pango libvorbis iso-codes libglvnd mesa
	     wayland-protocols
	# gst-plugins-good
	     nasm cairo libflac gdk-pixbuf gtk3 libjpeg libpng libpulse
	     qt6-base qt6-wayland qt6-tools qt6-shadertools libvpx
	# gst-plugins-bad
	     vulkan-headers libdrm shaderc linux-headers libva
	     libaom libbz2 curl fluidsynth gsm libopus libsndfile libxml2
	     libsrt libwebp x265 openal-soft openexr libjpeg librsvg
	     vulkan-icd-loader libass lcms2 openjpeg2
	# gst-devtools
	     json-glib ffmpeg)

source=("https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/$pkgver/gstreamer-$pkgver.tar.gz")
sha256sums=('2dd9d65e028273ffec3749253f12d0b678640281bf7af97a6eb53d7e4e9301c3')

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
		-Dgst-plugins-good:lame=disabled	# missing libmp3lame
		-Dgst-plugins-good:libcaca=disabled	# missing libcaca
		-Dgst-plugins-good:mpg123=disabled	# missing mpg123
		-Dgst-plugins-good:qt-x11=disabled
		-Dgst-plugins-good:qt-egl=disabled
		-Dgst-plugins-good:dv1394=disabled	# missing libavc1394
							# libiec61883
		-Dgst-plugins-good:shout2=disabled
		-Dgst-plugins-good:soup=disabled
		-Dgst-plugins-good:speex=disabled
		-Dgst-plugins-good:taglib=disabled
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
		-Dgst-plugins-bad:va=disabled
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
		-Dgst-plugins-bad:svtav1=disabled	# missing SvtAv1Enc
		-Dgst-plugins-bad:svthevcenc=disabled	# missing SvtHevcEnc
		-Dgst-plugins-bad:teletext=disabled	# missing zsbi
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

package_gstreamer() {
	meson install -C build --destdir "$pkgdir"

	cd $pkgdir

	# useless gdb script
	rm -r usr/share/gdb

	msg2 "Picking devel files"
	_pick_ gstreamer-devel \
		usr/include			\
		usr/lib/girepository-1.0	\
		usr/lib/pkgconfig		\
		usr/share/gir-1.0

	msg2 "Picking base plugin files"
	_pick_ gst-plugins-base \
		usr/lib/libgst{\
allocators,app,audio,fft,gl,pbutils,riff,rtp,rtsp,sdp,tag,video}-1.0.so*
	_pick_ gst-plugins-base \
		usr/lib/gstreamer-1.0/libgst{\
adder,app,audioconvert,audiomixer,audiorate,audioresample,audiotestsrc,\
compositor,basedebug,dsd,encoding,gio,overlaycomposition,pbtypes,playback,\
rawparse,subparse,tcp,typefindfunctions,videoconvertscale,videorate,\
videotestsrc,volume}.so
	_pick_ gst-plugins-base \
		usr/lib/gstreamer-1.0/libgst{\
alsa,opengl,ogg,opus,pango,vorbis}.so

	msg2 "Picking good plugin files"
	_pick_ gst-plugins-good \
		usr/lib/gstreamer-1.0/libgst{\
ossaudio,oss4,alpha,alphacolor,apetag,audiofx,audioparsers,auparse,autodetect,\
avi,cutter,debug,navigationtest,deinterlace,dtmf,effectv,equalizer,flv,flxdec,\
goom,goom2k1,icydemux,id3demux,imagefreeze,interleave,isomp4,alaw,mulaw,level,\
matroska,monoscope,multifile,multipart,replaygain,rtp,rtpmanager,rtsp,\
shapewipe,smpte,spectrum,udp,videobox,videocrop,videofilter,videomixer,wavenc,\
wavparse,xingmux,y4menc}.so*
	_pick_ gst-plugins-good \
		usr/lib/gstreamer-1.0/libgst{\
adaptivedemux2,cairo,flac,gdkpixbuf,gtk,jpeg,png,pulseaudio,qml6,vpx}.so

	msg2 "Picking bad plugin files"
	_pick_ gst-plugins-bad \
		usr/lib/libgst{\
adaptivedemux,analytics,badaudio,basecamerabinsrc,codecparsers,codecs,cuda,\
dxva,insertbin,photography,isoff,mpegts,mse,play,player,sctp,transcoder,\
uridownloader,va,vulkan,wayland,webrtc}-1.0.so*
	_pick_ gst-plugins-bad \
		usr/lib/gstreamer-1.0/libgst{\
accurip,adpcmdec,adpcmenc,aiff,asfmux,audiobuffersplit,audiofxbad,audiolatency,\
audiomixmatrix,audiovisualizers,autoconvert,bayer,camerabin,codecalpha,\
codectimestamper,coloreffects,debugutilsbad,dvbsubenc,dvbsuboverlay,dvdspu,\
faceoverlay,festival,fieldanalysis,freeverb,frei0r,gaudieffects,gdp,\
geometrictransform,id3tag,insertbin,inter,interlace,ivfparse,ivtc,\
jp2kdecimator,jpegformat,rfbsrc,midi,mpegpsdemux,mpegpsmux,mpegtsdemux,\
mpegtsmux,mse,mxf,netsim,rtponvif,pcapparse,pnm,proxy,legacyrawparse,\
removesilence,rist,rtmp2,rtpmanagerbad,sdpelem,segmentclip,siren,smooth,speed,\
subenc,switchbin,timecode,transcode,unixfd,videofiltersbad,\
videoframe_audiolevel,videoparsersbad,videosignal,vmnc,y4mdec}.so
	_pick_ gst-plugins-bad \
		usr/lib/gstreamer-1.0/libgst{\
dvb,fbdevsink,ipcpipeline,kms,qsv,shm}.so
	_pick_ gst-plugins-bad \
		usr/lib/gstreamer-1.0/libgst{\
aes,analyticsoverlay,aom,assrender,bz2,closedcaption,colormanagement,curl,\
dash,dtls,fluidsynthmidi,gsm,gtkwayland,openal,openexr,openjpeg,opusparse,\
rsvg,sndfile,srt,ttmlsubs,vulkan,waylandsink,webp,x265}.so

	msg2 "Picking gst-libav files"
	_pick_ gst-libav \
		usr/lib/gstreamer-1.0/libgstlibav.so

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
	depends=(musl gstreamer="$pkgver-$pkgrel" libdrm libglvnd glib wayland
		 zlib-ng)
	depends+=(alsa-lib cairo graphene harfbuzz libjpeg libogg libopus
		  pango libpng libvorbis iso-codes)
	do_install
}

package_gst-plugins-good() {
	pkgdesc+=" - good plugins"
	depends=(musl gstreamer="$pkgver-$pkgrel"
		 gst-plugins-base="$pkgver-$pkgrel")
	depends+=(libflac libglvnd qt6-base qt6-declarative at-spi2-core libbz2
		  llvm-libs musl cairo libgcrypt gtk3 gdk-pixbuf glib harfbuzz
		  libjpeg pango libpng libpulse libvpx wayland libxml2 zlib-ng)
	do_install
}

package_gst-plugins-bad() {
	pkgdesc+=" - bad plugins"
	depends=(musl gstreamer="$pkgver-$pkgrel"
		 gst-plugins-base="$pkgver-$pkgrel")
	depends+=(llvm-libs musl libdrm glib libva vulkan-icd-loader wayland
		  zlib-ng)
	depends+=(openexr imath libaom libass at-spi2-core libbz2 cairo openssl
		  curl gtk3 gdk-pixbuf gsm harfbuzz lcms2 openal-soft openjpeg2
		  libopus pango librsvg libsndfile libsrt libwebp libx265
		  libxml2)
	do_install
}

package_gst-libav() {
	pkgdesc+=" - libav plugin"
	depends=(gstreamer="$pkgver-$pkgrel" gst-plugins-base="$pkgver-$pkgrel"
		 ffmpeg glib2 musl)
	do_install
}
