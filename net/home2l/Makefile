PORTNAME=	home2l
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0
DISTVERSIONSUFFIX=	-12-gdf09
CATEGORIES=	net

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	The Home2Ls - Smart Tools for a Private Home 

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=  bash>0:shells/bash \
                ##git-tiny>0:devel/git@tiny \
                git>0:devel/git \
                swig>0:devel/swig \
	            readline>0:devel/readline \
                sdl2>0:devel/sdl20 \
                sdl2_ttf>0:graphics/sdl2_ttf \
                GraphicsMagick>0:graphics/GraphicsMagick \
                inkscape>0:graphics/inkscape \
                avr-gcc>0:devel/avr-gcc \
                avr-libc>0:devel/avr-libc \
                binutils>0:devel/avr-binutils
                
RUN_DEPENDS=	bash>0:shells/bash \
                mosquitto>0:net/mosquitto \
                avrdude>0:devel/avrdude
                
LIB_DEPENDS=    libmosquitto.so:net/mosquitto \
                libmosquittopp.so:net/mosquitto

##                mosquitto_dynamic_security.so:net/mosquitto
                 
                
USES=		compiler:c++11-lang gmake gettext python:3.9 \
            gettext-tools shebangfix

SHEBANG_GLOB=	*.sh *.py home2l-drv-weather check_pdf_links \
                home2l-showhouse home2l-fpc

USE_GITHUB=	yes
GH_ACCOUNT=	gkiefer
GH_PROJECT=	${PORTNAME}

MAKE_ENV=	ARCHS=amd64 MODS="resources brownies tools" INSTALL=/usr/local/home2l
LDFLAGS+=	

USERS=		home2l
GROUPS=		home2l

.include <bsd.port.mk>