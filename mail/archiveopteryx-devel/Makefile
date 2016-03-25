# Created by: Ashish SHUKLA <ashish@FreeBSD.org>
# $FreeBSD: head/mail/archiveopteryx-devel/Makefile 407488 2016-01-29 17:12:39Z feld $

PORTNAME=	archiveopteryx
PORTVERSION=	3.2.99.20160212
PORTREVISION=	1
CATEGORIES=	mail
PKGNAMESUFFIX=	-devel

MAINTAINER=	feld@FreeBSD.org
COMMENT=	Advanced PostgreSQL-based IMAP/POP server

LICENSE=	MIT

BUILD_DEPENDS=	jam:${PORTSDIR}/devel/jam

USE_GITHUB=	yes
GH_ACCOUNT=	mc3
GH_PROJECT=	aox
GH_COMMIT=	 e10c73a
GH_TAGNAME=	${GH_COMMIT}

USES=		perl5 tar:bzip2 pgsql:9.1+
USE_OPENSSL=	yes
USE_PERL5=	build

PORTDOCS=	COPYING README license.txt

SUB_FILES=	pkg-message

USE_RC_SUBR=	${PORTNAME}

CONFLICTS=	archiveopteryx-[0-9]*

USERS=		aox
GROUPS=		aox
PLIST_SUB+=	USERS="${USERS}"
PLIST_SUB+=	GROUPS="${GROUPS}"

JAM?=		${LOCALBASE}/bin/jam

.include <bsd.port.pre.mk>

# force Clang when on FreeBSD 10+
.if ${OSVERSION} >= 1000000
JAMARG=	"-sCLANG=1"
.endif

post-patch:
	@${GREP} -Rl '%%[[:alpha:]]\+%%' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} \
		-e 's,%%PREFIX%%,${PREFIX},g'
	${REINPLACE_CMD} "s|INSTALLROOT ?= \"\" ;|INSTALLROOT = \"${STAGEDIR}\" ;|" ${WRKSRC}/Jamsettings

do-build:
	@cd ${WRKSRC} && ${JAM} ${JAMARG}

do-install:
	@cd ${WRKSRC} && ${JAM} ${JAMARG} install

.include <bsd.port.post.mk>