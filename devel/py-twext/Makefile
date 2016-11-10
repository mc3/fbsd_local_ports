# $FreeBSD: head/devel/py-twext/Makefile 424411 2016-10-21 12:51:40Z mat $

PORTNAME=	twext
PORTVERSION=	0.20160928
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	Extensions to Twisted

LICENSE=	APACHE20

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=15.4.0:devel/py-twisted
RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}cffi>=0.6:devel/py-cffi \
 ${PYTHON_PKGNAMEPREFIX}twisted>=16.3:devel/py-twisted

DAL_RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}sqlparse>=0.1.11:databases/py-sqlparse
POSTGRES_RUN_DEPENDS=	\
 ${PYTHON_PKGNAMEPREFIX}pg8000>=1.10.2:databases/py-pg8000

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
GH_TAGNAME=	9d1d9bd

.include <bsd.port.mk>
