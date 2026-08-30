.PHONY: node conda

# Load .env file
ifneq (,$(wildcard .env))
    include .env
    export $(shell sed 's/=.*//' .env)
endif

node:
	conda run -n $(conda_name) nodeenv -p

conda:
	conda env create -f environment.yml -n $(conda_name)