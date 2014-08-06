## API styleguide

### RESTful behaviour and HTTP status codes

- Use `202` for times when the data is valid, but we've queued the persistence for background processing, as described in [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.2.3):

  > The request has been accepted for processing, but the processing has not
  > been completed.

- Use `422` for validation errors, as described in [RFC 2918](http://tools.ietf.org/html/rfc4918). As described in the RFC:

  > The 422 (Unprocessable Entity) status code means the server understands the
  > content type of the request entity (hence a 415(Unsupported Media Type)
  > status code is inappropriate), and the syntax of the request entity is
  > correct (thus a 400 (Bad Request) status code is inappropriate) but was
  > unable to process the contained instructions.  For example, this error
  > condition may occur if an XML request body contains well-formed (i.e.,
  > syntactically correct), but semantically erroneous, XML instructions.
