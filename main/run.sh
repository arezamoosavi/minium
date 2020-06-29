#!/bin/bash


set -o errexit
set -o nounset

PORT=3000
HOST=0.0.0.0


uvicorn run_app:app --host ${HOST} --port ${PORT} --reload --ws 'auto' \
--loop 'auto' --workers 8
