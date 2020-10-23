#!/bin/bash
push:
	@githome
	@git status
	@git add .
	@git commit -m "Added quer[y] || [ies]"
	@git status
	@git push