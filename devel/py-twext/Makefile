# $FreeBSD$

PORTNAME=	twext
PORTVERSION=	0.20170227
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	Extensions to Twisted

LICENSE=	APACHE20

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=16.6.0:devel/py-twisted@${FLAVOR}
RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}cffi>=0.6:devel/py-cffi@${FLAVOR} \
 ${PYTHON_PKGNAMEPREFIX}twisted>=16.6:devel/py-twisted@${FLAVOR}

DAL_RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}sqlparse02==0.2.0:databases/py-sqlparse02@${FLAVOR} \

POSTGRES_RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}pg8000>=1.10.2:databases/py-pg8000@${FLAVOR}

OPTIONS_DEFINE=	DAL POSTGRES
DAL_DESC=	Enables use of the Database Abstraction Layer.
POSTGRES=	Enables support for Postgres database connectivity.
OPTIONS_DEFAULT=	DAL POSTGRES
.include <bsd.port.options.mk>

USES=		python:2.7
USE_PYTHON=	distutils autoplist
NO_ARCH=yes

USE_GITHUB=	yes
GH_ACCOUNT=	apple
GH_PROJECT=	ccs-twistedextensions
GH_TAGNAME=	2c4046d

post-patch:
	@${REINPLACE_CMD} -e 's|"{}a1+unknown".format(base_version)|"0.20170227"|' ${WRKSRC}/setup.py

.include <bsd.port.mk>
