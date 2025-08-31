PORT ?= 4500
LOG_FILE = /tmp/jekyll$(PORT).log
PID_FILE = /tmp/jekyll$(PORT).pid
TAIL_PID_FILE = /tmp/jekyll_tail$(PORT).pid

SHELL = /bin/bash -c
.SHELLFLAGS = -e

DESTINATION_DIRECTORY = _posts
NOTEBOOK_DIR = _notebooks

# ---------- Default ----------
default: serve-current

# ---------- Notebook conversion ----------
convert:
	@echo "Converting notebooks to Markdown..."
	@python3 -c "from scripts.convert_notebooks import convert_notebooks; convert_notebooks()"

# ---------- Serve / Stop ----------
serve-current: stop convert
	@echo "Starting Jekyll server..."
	@nohup bash -c 'bundle install && bundle exec jekyll serve -H 127.0.0.1 -P $(PORT) > $(LOG_FILE) 2>&1 &' \
		; echo $$! > $(PID_FILE)
	@echo "Starting logging..."
	@nohup bash -c 'tail -f $(LOG_FILE)' > /dev/null 2>&1 & echo $$! > $(TAIL_PID_FILE)
	@echo "Server PID saved to $(PID_FILE)"
	@echo "Logging PID saved to $(TAIL_PID_FILE)"
	@until grep -q "Server address:" $(LOG_FILE); do sleep 1; done
	@echo "Server started:"
	@grep "Server address:" $(LOG_FILE)

stop:
	@echo "Stopping Jekyll server..."
	@if [ -f $(PID_FILE) ]; then \
		kill $$(cat $(PID_FILE)) >/dev/null 2>&1 || true; \
		rm -f $(PID_FILE); \
		echo "Server stopped"; \
	else \
		echo "No server PID file found"; \
	fi
	@echo "Stopping logging..."
	@if [ -f $(TAIL_PID_FILE) ]; then \
		kill $$(cat $(TAIL_PID_FILE)) >/dev/null 2>&1 || true; \
		rm -f $(TAIL_PID_FILE); \
		echo "Logging stopped"; \
	else \
		echo "No logging PID file found"; \
	fi
	@rm -f $(LOG_FILE) || true

# ---------- Build ----------
build-current: clean
	@bundle install
	@bundle exec jekyll clean
	@bundle exec jekyll build

# ---------- Clean ----------
clean: stop
	@echo "Cleaning converted IPYNB files..."
	@find $(DESTINATION_DIRECTORY) -type f -name '*_IPYNB_2_.md' -exec rm {} +
	@echo "Removing empty directories in $(DESTINATION_DIRECTORY)..."
	@while [ $$(find $(DESTINATION_DIRECTORY) -type d -empty | wc -l) -gt 0 ]; do \
		find $(DESTINATION_DIRECTORY) -type d -empty -exec rmdir {} +; \
	done
	@echo "Removing _site directory..."
	@rm -rf _site

# ---------- Themes ----------
use-minima:
	@cp _themes/minima/_config.yml _config.yml
	@cp _themes/minima/Gemfile Gemfile
	@cp _themes/minima/opencs.html _layouts/opencs.html
	@cp _themes/minima/page.html _layouts/page.html
	@cp _themes/minima/post.html _layouts/post.html

use-text:
	@cp _themes/text/_config.yml _config.yml
	@cp _themes/text/Gemfile Gemfile
	@cp _themes/text/opencs.html _layouts/opencs.html
	@cp _themes/text/page.html _layouts/page.html
	@cp _themes/text/post.html _layouts/post.html
	@cp _themes/text/navigation.yml _data/navigation.yml

use-cayman:
	@cp _themes/cayman/_config.yml _config.yml
	@cp _themes/cayman/Gemfile Gemfile
	@cp _themes/cayman/opencs.html _layouts/opencs.html
	@cp _themes/cayman/page.html _layouts/page.html
	@cp _themes/cayman/post.html _layouts/post.html

use-so-simple:
	@cp _themes/so-simple/_config.yml _config.yml
	@cp _themes/so-simple/Gemfile Gemfile
	@cp _themes/so-simple/opencs.html _layouts/opencs.html
	@cp _themes/so-simple/page.html _layouts/page.html
	@cp _themes/so-simple/post.html _layouts/post.html
	@cp _themes/so-simple/navigation.yml _data/navigation.yml

use-yat:
	@cp _themes/yat/_config.yml _config.yml
	@cp _themes/yat/Gemfile Gemfile
	@cp _themes/yat/opencs.html _layouts/opencs.html
	@cp _themes/yat/page.html _layouts/page.html
	@cp _themes/yat/post.html _layouts/post.html

# ---------- Serve/Build Shortcuts ----------
serve: serve-current
build: build-current
refresh: stop clean serve
reload: stop serve
