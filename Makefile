.POSIX:
.PHONY: *

.EXPORT_ALL_VARIABLES:
# ####################################################
INVENTORY_PATH ?= inventory/
INVENTORY_FILE ?= /hosts.yaml
ENV_FILE ?= .env
# ####################################################

init:
	@echo "Add \"${ENV_FILE}\" file"
	if [ ! -f  ${ENV_FILE} ] ; then \
    	touch ${ENV_FILE} && echo "SUDO_PW=<PASSWORD>" > ${ENV_FILE} ; \
    fi;

install_requirements:
	ansible-galaxy install -r collection/requirements.yaml --force
	ansible-galaxy list

install: install_requirements
	ansible-playbook -i ${INVENTORY_PATH} playbooks/laptop.yaml

commons:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            --tags commons