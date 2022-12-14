.POSIX:
.PHONY: *

.EXPORT_ALL_VARIABLES:
# ####################################################
INVENTORY_PATH ?= inventory/
INVENTORY_FILE ?= /hosts.yaml
# ####################################################
ENV ?= .env
-include ${ENV}

# ##################################################################################################
# Init ENV file

init:
	echo "Add \"${ENV}\" file"
	if [ ! -f  ${ENV} ] ; then \
    	touch ${ENV} && echo "SUDO_PW=<PASSWORD>" > ${ENV} ; \
    fi; \
    echo "Open ${ENV} and set your sudo password"

# ##################################################################################################
# Install ansible-galaxy requiremnets

install_requirements:
	ansible-galaxy install -r collection/requirements.yaml --force
	ansible-galaxy list

# ##################################################################################################
# Install all

install: install_requirements
	ansible-playbook -i ${INVENTORY_PATH} playbooks/laptop.yaml \
    	-e "ansible_become_password=${SUDO_PW}"

# ##################################################################################################
# Commons

commons:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}" \
            	--tags commons

# ##################################################################################################
# Development
development:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}" \
            	--tags virtualization

# ##################################################################################################
# Deployments

deployment:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}"\
            --tags deployment

# ##################################################################################################
# Terminal

terminal:
	ansible-playbook -i ${INVENTORY_PATH} \
            playbooks/laptop.yaml \
            	-e "ansible_become_password=${SUDO_PW}"\
            --tags terminal