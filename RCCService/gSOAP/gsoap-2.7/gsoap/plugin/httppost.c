/*

httppost.c

gSOAP HTTP POST plugin for non-SOAP payloads.
Note: multipart/related and multipart/form-data are already handled in gSOAP.

gSOAP XML Web services tools
Copyright (C) 2004-2005, Robert van Engelen, Genivia, Inc. All Rights Reserved.

--------------------------------------------------------------------------------
gSOAP public license.

The contents of this file are subject to the gSOAP Public License Version 1.3
(the "License"); you may not use this file except in compliance with the
License. You may obtain a copy of the License at
http://www.cs.fsu.edu/~engelen/soaplicense.html
Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
for the specific language governing rights and limitations under the License.

The Initial Developer of the Original Code is Robert A. van Engelen.
Copyright (C) 2000-2004 Robert A. van Engelen, Genivia inc. All Rights Reserved.
--------------------------------------------------------------------------------
GPL license.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 59 Temple
Place, Suite 330, Boston, MA 02111-1307 USA

Author contact information:
engelen@genivia.com / engelen@acm.org

This program is released under the GPL with the additional exemption that
compiling, linking, and/or using OpenSSL is allowed.
--------------------------------------------------------------------------------

	Compile & link with stand-alone gSOAP server.

	Usage (server side):

	struct soap soap;
	soap_init(&soap);
	soap_register_plugin_arg(&soap, http_post, http_post_handler);
	...
	... = soap_copy(&soap); // copies plugin too but not its data: plugin data is shared since fcopy is not set
	...
	soap_done(&soap); // detach plugin (calls plugin->fdelete)

	You need to define a HTTP handling function at the server-side:

	int http_post_handler(struct soap*)

	which will be called from the plugin upon an HTTP POST request that
	matches the content-type requirements.
	The function should return an error code or SOAP_STOP to prevent the
	gSOAP engine from processing the message body;

	This function should also produce a valid HTTP response, for example:

	if (we want to return HTML)
	  soap_response(soap, SOAP_HTML); // use this to return HTML...
	else
	{ soap->http_content = "image/jpeg"; // a jpeg image
	  soap_response(soap, SOAP_FILE); // SOAP_FILE sets custom http content
	}
	...
	soap_send(soap, "<HTML>...</HTML>"); // example HTML
	...
	soap_end_send(soap);

*/

#include "httppost.h"

#ifdef __cplusplus
extern "C" {
#endif

const char http_post_id[14] = HTTP_POST_ID;

static int http_post_init(struct soap *soap, struct http_post_data *data, int (*handler)(struct soap*));
static void http_post_delete(struct soap *soap, struct soap_plugin *p);
static int http_post_parse_header(struct soap *soap, const char*, const char*);
static int http_post_handler(struct soap *soap);

int http_post(struct soap *soap, struct soap_plugin *p, void *arg)
{ p->id = http_post_id;
  p->data = (void*)malloc(sizeof(struct http_post_data));
  p->fdelete = http_post_delete;
  if (p->data)
    if (http_post_init(soap, (struct http_post_data*)p->data, (int (*)(struct soap*))arg))
    { free(p->data); /* error: could not init */
      return SOAP_EOM; /* return error */
    }
  return SOAP_OK;
}

static int http_post_init(struct soap *soap, struct http_post_data *data, int (*handler)(struct soap*))
{ data->fparsehdr = soap->fparsehdr; /* save old HTTP header parser callback */
  soap->fparsehdr = http_post_parse_header; /* replace HTTP header parser callback with ours */
  if (handler)
    soap->fform = handler;
  return SOAP_OK;
}

static void http_post_delete(struct soap *soap, struct soap_plugin *p)
{ free(p->data); /* free allocated plugin data (this function is not called for shared plugin data, but only when the final soap_done() is invoked on the original soap struct) */
}

static int http_post_parse_header(struct soap *soap, const char *key, const char *val)
{ struct http_post_data *data = (struct http_post_data*)soap_lookup_plugin(soap, http_post_id);
  if (!data)
    return SOAP_PLUGIN_ERROR;
  soap->error = data->fparsehdr(soap, key, val); /* parse HTTP header */
  if (soap->error == SOAP_OK)
  { if (!soap_tag_cmp(key, "Content-Type"))
    { /* check content type: you can filter any type of payloads here */
      if (!soap_tag_cmp(val, "application/x-www-form-urlencoded"))
        soap->error = SOAP_FORM; /* delegate body parsing to handler */
      else if (!soap_tag_cmp(val, "image/*"))
        soap->error = SOAP_FORM; /* delegate images of any type */
    }
  }
  return soap->error;
}

/******************************************************************************/

#ifdef __cplusplus
}
#endif

