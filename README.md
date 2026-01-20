# jenin-mail-redirect

A simple Python redirect service that forwards all requests to fulfillment.hackclub.com.

## Features

- Redirects all incoming requests to `https://fulfillment.hackclub.com` with the same path
- Preserves URL paths and query parameters
- No UI - pure redirect functionality
- Lightweight Flask application

## Setup

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Run the application:
```bash
python app.py
```

The server will start on `http://0.0.0.0:5000` by default.

## Usage

Once running, any path accessed on this service will redirect to the same path on fulfillment.hackclub.com:

- `http://localhost:5000/abc` → `https://fulfillment.hackclub.com/abc`
- `http://localhost:5000/test/path?foo=bar` → `https://fulfillment.hackclub.com/test/path?foo=bar`

## Deployment

For production deployment, use a production WSGI server like Gunicorn:

```bash
pip install gunicorn
gunicorn app:app
```