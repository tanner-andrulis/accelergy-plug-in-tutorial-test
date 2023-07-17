#!/bin/bash
accelergy
accelergyTables
export JUPYTER_RUNTIME_DIR=/tmp
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root accelergy-plug-in-tutorial/creating_first_plug_in.ipynb
