# Document Parser

> This app does one little thing, and does it well. Which is to wrap the [`yomu`](https://github.com/Erol/yomu) gem.

Small Rails API app to parse documents.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/buren/document_parser)

## API

__Parse a document__:

Request

`POST /document`.

```json
{
  "file": "base64-endcoded-string-goes-here..."
}
```

Response

```json
{
    "title": "The title of the document",
    "content_type": "application/pdf",
    "created_at": "2015-08-17T22:29:23Z",
    "metadata": {
        "Content-Type": "application/pdf",
        "Creation-Date": "2015-08-17T22:29:23Z",
        "X-Parsed-By": [
            "org.apache.tika.parser.DefaultParser",
            "org.apache.tika.parser.pdf.PDFParser"
        ],
        "title": "The title of the document",
        "xmpTPg:NPages": "1"
    },
    "text": "The contents of the document will be returned here."
}
```

## Configuration

__Configuration__

`API_AUTH_TOKEN` - optional ENV-variable to protect API endpoints.

## Deploy

One click deploy to Heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/buren/document_parser)

## Dependencies

* Rails 5.1
* System dependencies
  - Ruby 2.4
  - java
