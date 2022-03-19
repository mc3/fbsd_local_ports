PORTNAME=	home2l
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0
DISTVERSIONSUFFIX=	-12-gdf09
CATEGORIES=	net

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	The Home2Ls - Smart Tools for a Private Home 

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

##RUN_DEPENDS=	${LOCALBASE}/lib/alsa-lib/libasound_module_pcm_oss.so:audio/alsa-plugins
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfreetype.so:print/freetype2 \
		libcurl.so:ftp/curl \
		libjack.so:audio/jack

USES=		compiler:c++11-lang gmake pkgconfig
USE_GITHUB=	yes
USE_GL=		gl
USE_XORG=	x11 xcursor xext xinerama
GH_ACCOUNT=	gkiefer
GH_PROJECT=	${PORTNAME}

MAKE_ENV=	DATADIR=${DATADIR:Q} LIBDIR=${PREFIX:Q}/lib \
		DOCSDIR=${DOCSDIR:Q} DESKTOPDIR=${DESKTOPDIR:Q}
LDFLAGS+=	-lexecinfo

.include <bsd.port.mk>