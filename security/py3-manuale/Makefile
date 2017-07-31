# Created by: Axel Rau <axel.rau@chaos1.de>
# $FreeBSD:$

PORTNAME=	manuale
PORTVERSION=	1.1.0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	Fully manual Let's Encrypt/ACME client

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=1.7.2:security/py3-cryptography \
		${PYTHON_PKGNAMEPREFIX}requests>=2.18.1:www/py3-requests

USES=		python:3.5+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
