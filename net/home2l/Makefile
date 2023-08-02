PORTNAME=		home2l
DISTVERSIONPREFIX=	v
DISTVERSION=	1.2
DISTVERSIONSUFFIX=	-1
CATEGORIES= 	net

MAINTAINER=		axel.rau@chaos1.de
COMMENT=		Home2Ls - Smart Tools for a Private Home
WWW=			https://github.com/mc3/home2l/

LICENSE=		GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE



RUN_DEPENDS=	bash>0:shells/bash \
					mosquitto>0:net/mosquitto \
					avrdude>0:devel/avrdude \
					${PYTHON_PKGNAMEPREFIX}psycopg>0:databases/py-psycopg@${PY_FLAVOR}

LIB_DEPENDS=	libmosquitto.so:net/mosquitto \
					libmosquittopp.so:net/mosquitto \
					##mosquitto_dynamic_security.so:net/mosquitto
BUILD_DEPENDS=	bash>0:shells/bash \
					##git-tiny>0:devel/git@tiny \
					git>0:devel/git \
					swig>0:devel/swig \
					readline>0:devel/readline \
					sdl2>0:devel/sdl20 \
					sdl2_ttf>0:graphics/sdl2_ttf \
					GraphicsMagick>0:graphics/GraphicsMagick \
					inkscape>0:graphics/inkscape \
					optipng>0:graphics/optipng \
					avr-gcc>0:devel/avr-gcc \
					avr-libc>0:devel/avr-libc \
					binutils>0:devel/avr-binutils

USES=		gmake gettext python:3.9+ \
			gettext-tools shebangfix

SHEBANG_GLOB=	*.sh *.py home2l-drv-weather check_pdf_links \
				home2l-showhouse home2l-fpc \
				home2l home2l-adb home2l-demo home2l-install \
				home2l-rollout home2l-sudo

USE_GITHUB= yes
GH_ACCOUNT= mc3
GH_PROJECT= ${PORTNAME}
GH_TAGNAME= 2d93849fb73771827d6a08277e36778991df6855
USE_RC_SUBR=	home2l

post-extract:
			${SH} ${PATCHDIR}/home2l_packages.sh

post-install:
			${MKDIR} ${STAGEDIR}$/home2l

PREFIX=${LOCALBASE}/home2l

MAKE_ENV=	CFG=basic ARCHS=${ARCH} WITH_PYTHON=1 \
			MODS="tools resources brownies locales" \
			WITH_READLINE=1 STAGE_INSTALL=${PREFIX} \
			WITH_USR_LOCAL=1 HOME2L_FREEBSD_BUILD=${WRKDIRPREFIX}${.CURDIR}/work \
			BUILD_VERSION="1.2-2"

USERS=		home2l
GROUPS=		home2l

.include <bsd.port.mk>
