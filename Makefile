#!/bin/bash
push:
	@githome
	@git status
	@git add .
	@git commit -m "A bit of cleanup"
	@git status
	@git push