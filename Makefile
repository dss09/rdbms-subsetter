.PHONY: clean
clean: clean-build clean-pyc clean-test clean-cache ## remove all build, test, coverage and Python artifacts

.PHONY: clean-build
clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	rm -rf domains/bill/.build
	rm -rf domains/partner/.build
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

.PHONY: clean-pyc
clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -not -path "./frontend/contrib/siesta/*" -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

.PHONY: clean-test
clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -f .coverage.*
	rm -rf coverage/
	rm -fr htmlcov/
	rm -rf reports/
	rm -fr .pytest_cache
	rm -rf screenshots/
	rm -rf teamcity-info.xml
	find . -name '*.tmp' -exec rm -f {} +

.PHONY: clean-cache
clean-cache: ## remove pip cache
	rm -rf .cache

.PHONY: clean-venv
clean-venv: ## remove local venv
	rm -rf `pipenv --venv`

.PHONY: env-prepare
env-prepare: ## install environment
	pipenv install --dev