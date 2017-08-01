# $FreeBSD: head/databases/py-postgresql/Makefile 376731 2015-01-10 23:15:27Z demon $

PORTNAME=	postgresql
PORTVERSION=	1.2.1
CATEGORIES=	databases python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	postgresql

MAINTAINER=	c.kworr@gmail.com
COMMENT=	Python 3 compatible PostgreSQL database driver and tools

LICENSE=	BSD3CLAUSE

USE_GITHUB=	yes
GH_ACCOUNT=	python-postgres
GH_PROJECT=	fe
GH_TAGNAME=	f7d0758

USES=		pgsql python:3.3+
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
