import json
import os

import redis
import hiredis
import flask

app = flask.Flask(__name__)

def get_redis():
  if 'redis_connection' not in flask.g:
    redis_connection = redis.Redis(host=os.getenv('REDIS_HOST'), port=os.getenv('REDIS_PORT'), db=os.getenv('REDIS_DB'))
    flask.g.redis_connection = redis_connection
  return flask.g.redis_connection

def get_count():
  return str(get_redis().get('count').decode("utf-8")) or 0

@app.route('/')
def hello():
  get_redis().incr('count')
  response = {
    "message": "Hello, World!", 
    "count": get_count(),
    "secret": os.getenv('SOME_SECRET')
  }
  return json.dumps(response)

app.run(host=os.getenv('APP_HOST'), port= os.getenv('APP_PORT'))
