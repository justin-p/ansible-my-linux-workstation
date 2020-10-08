# ansible-playbook-my-linux-workstation

[![Github Actions](https://img.shields.io/github/workflow/status/justin-p/ansible-playbook-my-linux-workstation/CI?label=Github%20Actions&logo=github&style=flat-square)](https://github.com/justin-p/ansible-playbook-my-linux-workstation/actions)

A Ansible playbook that configures a clean install of linux to my preferences. Tested against Ubuntu 18.04, 20.04 and Parrot Security Core.

## Installation

### Quick

1. Run `curl https://raw.githubusercontent.com/justin-p/ansible-playbook-my-linux-workstation/master/setup.sh | bash`
2. Enter sudo password.
3. Reboot the system.

### Manual

1. `git clone https://github.com/justin-p/ansible-my-linux-workstation`
2. `cd ansible-my-linux-workstation`
4. `sudo apt-get update -y && sudo apt-get install git curl python3 python3-pip`
5. `pip3 install --user ansible `
6. `export PATH=$PATH:/$HOME/.local/bin`
7. `ansible-galaxy install -r requirements.yml`
8. `ansible-playbook main.yml -i inventory.yml`
9. Reboot the system.

## Local Development

This playbook includes Molecule that will spin up a local docker environment to deploy, configure and test this playbook.

Development requirements:

- Docker
- Molecule
- yamllint
- ansible-lint

or simply use a VM with [this](https://github.com/justin-p/ansible-terraform-workstation) configuration.

### Basic Molecule usage

- Build a container and apply the current playbook: `molecule converge`  
Note, when using converge the container is not destroyed, allowing you to quickly test changes by running this command consecutive times.

- Interact with the containers created by molecule: `molecule login`  
Note, this works great with converge allowing you to peek inside the container and manually check why things didnt work.

- Apply tests defined in the `verify.yml` file: `molecule verify`

- Remove any containers left over from the converge command: `molecule destroy`

- Run the playbook and any included tests against clean containers: `molecule test`

## License

MIT

## Authors

Justin Perdok ([@justin-p](https://github.com/justin-p/))

## Contributing

Feel free to open issues, contribute and submit your Pull Requests. You can also ping me on Twitter ([@JustinPerdok](https://twitter.com/JustinPerdok)).
