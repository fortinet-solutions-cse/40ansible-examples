# 40ansible-examples
Separate example repo with 40ansible as a subrepo

Follow next instructions:

`git clone https://github.com/fortinet-solutions-cse/40ansible.git`

`cd 40ansible`

Copy the file fortigate_mix.yml to your base dir:

`cp examples/fortigate_mix.yml .`

Adapt the IP of the Fortigate in fortigate_mix.yml to your environment

`ansible-playbook fortigate_mix.yml`

You can then write your own playbooks and use inventory.
