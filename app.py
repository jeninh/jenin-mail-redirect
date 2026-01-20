from flask import Flask, redirect, request

app = Flask(__name__)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    """Redirect all requests to fulfillment.hackclub.com with the same path."""
    target_url = f"https://fulfillment.hackclub.com/{path}"
    
    # Preserve query parameters if any
    if request.query_string:
        target_url += f"?{request.query_string.decode('utf-8')}"
    
    return redirect(target_url, code=301)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
