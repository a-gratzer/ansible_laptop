.POSIX:
.PHONY: *

.EXPORT_ALL_VARIABLES:
# ####################################################
INVENTORY_PATH ?= inventory/
INVENTORY_FILE ?= /hosts.yaml
# ####################################################
ENV ?= .env
-include ${ENV}

init:
	@echo "Add \"${ENV}\" file"
	if [ ! -f  ${ENV} ] ; then \
    	touch ${ENV} && echo "SUDO_PW=<PASSWORD>" > ${ENV} ; \
    fi; \
    @echo "Open ${ENV} and set your sudo password"

install_requirements:
	ansible-galaxy install -r collection/requirements.yaml --force
	ansible-galaxy list

install: install_requirements
	ansible-playbook -i ${INVENTORY_PATH} playbooks/laptop.yaml \
    	-e "ansible_become_password=${SUDO_PW}"

commons:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}" \
            	--tags commons

deployment:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}" \
            	--tags contabo
