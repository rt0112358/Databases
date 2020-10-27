#!/bin/bash
push:
	@githome
	@git status
	@git add .
	@git commit -m "Starting to fix query 19"
	@git status
	@git push
