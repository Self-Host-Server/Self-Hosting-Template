.PHONY: node conda

# Load .env file
ifneq (,$(wildcard .env))
    include .env
    export $(shell sed 's/=.*//' .env)
endif

run:=conda run -n $(conda_name) 

node:
	$(run) nodeenv -p
	$(run) npm install
	$(run) npm update

conda:
	conda env create -f environment.yml -n $(conda_name)
	make node