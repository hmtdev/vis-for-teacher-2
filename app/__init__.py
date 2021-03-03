from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)
basedir  = os.path.abspath(os.path.dirname(__file__))

username = 'postgres'
password = 'Tuan1211'
db_name = 'vis_for_teacher'
host = 'localhost'
port = '5432'

app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://{}:{}@{}:{}/{}".format(username, password, host, port, db_name)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from app.models import * # import all schema table
from app.routes import *