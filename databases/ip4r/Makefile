# Created by: Ade Lovett <ade@FreeBSD.org>
# $FreeBSD: head/databases/ip4r/Makefile 487272 2018-12-12 01:35:33Z gerald $

PORTNAME=	ip4r
PORTVERSION=	2.4
PORTREVISION=	3
CATEGORIES=	databases net

MAINTAINER=	tobez@FreeBSD.org
COMMENT=	IP address and IP range index types for PostgreSQL

LICENSE=	PostgreSQL

USES=		gmake pgsql
LLD_UNSAFE=	yes

MAKE_ARGS=	USE_PGXS=1

.include <bsd.port.options.mk>

USE_GITHUB=	yes
GH_ACCOUNT=	RhodiumToad

.include <bsd.port.mk>
