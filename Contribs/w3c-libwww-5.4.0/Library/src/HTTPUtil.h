/*

  
  					W3C Sample Code Library libwww HTTP COMMON


!
  HTTP Communalities between Server and Client Module
!
*/

/*
**	(c) COPYRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
*/

/*

The HTTP client module and the
server module has a few things in common which
we keep in this file.
*/
#ifndef HTTPUTIL_H
#define HTTPUTIL_H

/*
(
  HTTP Version Management
)
*/

typedef enum _HTTPVersion {
    HTTP = 0,
    HTTP_09,		
    HTTP_10,
    HTTP_11,
    HTTP_12
} HTTPVersion;

/*
(
  Versions supported by HTTP
)
*/

#define HTTP_VERSION_10	"HTTP/1.0"
#define HTTP_VERSION	"HTTP/1.1"

/*
*/

#endif

/*

  

  @(#) $Id: HTTPUtil.html,v 2.7 1997/02/16 18:43:07 frystyk Exp $

*/
