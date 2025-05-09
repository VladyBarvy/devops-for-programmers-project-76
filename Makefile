setup:
	ansible-playbook playbook_setup.yml --vault-password-file vault_password -i inventory.ini

deploy:
	ansible-playbook playbook.yml --vault-password-file vault_password -i inventory.ini

monitoring:
	ansible-playbook playbook.yml --tags datadog --vault-password-file vault_password -i inventory.ini

encrypt:
	ansible-vault encrypt --ask-vault-password group_vars/webservers/vault.yml

decrypt:
	ansible-vault decrypt --ask-vault-password group_vars/webservers/vault.yml