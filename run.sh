#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Install dependencies
pip install -r requirements.txt

# Run the test
python -m locust \
  -f locustfile.py \
  --headless \
  -u 2 \
  -r 1 \
  -t 1m \
  --csv=reports/report \
  --host=https://$JFROG_PLATFORM_ID.jfrog.io
