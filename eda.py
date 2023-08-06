# imports
import os
import sys
import toml
import ibis
import ibis.selectors as s
import logging as log
import plotly.io as pio
import plotly.express as px

from dotenv import load_dotenv
from datetime import datetime, timedelta, date

# configuration

## config.toml
config = toml.load("config.toml")["eda"]

## plotly config
pio.templates.default = "plotly_dark"

## load .env file
load_dotenv()

# connect to database
database = config["database"]
log.info(f"database: {database}")
con = ibis.connect(f"duckdb://{database}")
ibis.options.interactive = True

# load tables
