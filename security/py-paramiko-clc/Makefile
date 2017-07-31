# Created by: Axel Rau <axel.rau@chaos1.de>
# $FreeBSD:$

PORTNAME=	paramiko-clc
PORTVERSION=	2.1.2
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	SSH2 protocol library, compatible with command line ssh

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=1.1:security/py3-cryptography \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0.1.7:devel/py3-pyasn1

USES=		python:3.5+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
