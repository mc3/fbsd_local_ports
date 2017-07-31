# Created by: Axel Rau <axel.rau@chaos1.de>
# $FreeBSD:$

PORTNAME=	serverPKI
PORTVERSION=	0.9.1
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	PKI for internet server infrastructure

LICENSE=	GPLv3+

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=1.7.2:security/py3-cryptography \
		${PYTHON_PKGNAMEPREFIX}manuale>=1.1.0:security/py3-manuale \
		${PYTHON_PKGNAMEPREFIX}paramiko-clc>=2.1.2:security/py-paramiko-clc \
		${PYTHON_PKGNAMEPREFIX}pycrypto>=2.6.1:security/py3-pycrypto \
		${PYTHON_PKGNAMEPREFIX}openssl>=16.2.0:security/py3-openssl \
		${PYTHON_PKGNAMEPREFIX}postgresql>=1.1.0:databases/py-postgresql 

USES=		python:3.5+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
