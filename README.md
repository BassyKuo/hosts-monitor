# Hosts-Monitor

#### Version 2.0


The light service to manage suspicious hosts.  This repository contains:

* **hosts-monitor.service** : 
    the main daemon to ban the suspect per hour. 

    * Default report: `/home/hosts-monitor.report`
    * Default shortcut: `/etc/ssh/sshd_banner`

###### Above 2 paths set in `config` file.

* **hosts-monitor** : 
    user command to easily list log in hosts-monitor.report, show the ip status, ban/unban specific ips manually (root only), control `hosts-monitor.service` service to ON/OFF (root only), and set allow/deny rules to hosts-monitor.service.

    * log path: `/home/hosts-monitor.report` 
    * ban-list: `/etc/hosts.deny` (the only ban-list accessed.  If you unban unsuccessfully, check whether another ban-list is running or not.)

* **config** :
    the configure file including the report path, and allow/deny rules. edit this file if you need.

* **INSTALL** :
    * Default installation directory: `INSTALL_DIR=/opt/hosts-monitor`
    * Default service path: `SERVICE=/etc/cron.hourly/hosts-monitor.service`


## Setup

```sh
$ sudo ./INSTALL
```

or change the installation path:
```sh
$ INSTALL_DIR=/opt/HM SERVICE=/etc/cron.daily ./INSTALL
```



## Usage Examples

   1. list/search log

```sh
$ hosts-monitor log                     # show today's log
$ hosts-monitor log \(root\|admin\)     # show log which contains `root` or `admin`
$ hosts-monitor log --status ban        # show the ban list
$ hosts-monitor log --help
```

   2. show ip status

```sh
$ hosts-monitor show 114.89.62.1        # show 114.89.62.1 status
$ hosts-monitor show --help
```

   3. ban/unban ip [root only]

```sh
$ sudo hosts-monitor ban 1.1.1.1            # add 1.1.1.1 into /etc/hosts.deny
$ sudo hosts-monitor ban 1.1.1.1 2.2.2.2    # allow multiple ips
$ sudo hosts-monitor ban -m 'BruteForce' 1.1.1.1 2.2.2.2   # add description(no space) about ips
$ sudo hosts-monitor unban 2.2.2.2          # remove 2.2.2.2 from /etc/hosts.deny
$ hosts-monitor ban --help
```

   4. control `hosts-monitor.service` [root only]

```sh
$ sudo hosts-monitor service stop       # disable hosts-monitor.service
$ sudo hosts-monitor service restart    # enable hosts-monitor.service and run it
$ hosts-monitor service --help
```

   5. add allow/deny rules for `hosts-monitor.service` [root only]

```sh
$ sudo hosts-monitor rule --set-deny test user   # login with `test` or `user` will be rejected
$ sudo hosts-monitor rule --remove root          # cancel this rule
$ sudo hosts-monitor rule --show                 # show all rules
$ hosts-monitor rule --help
```

Type `hosts-monitor help` for more description.


## TODO
- [x] Merge hosts-monitor & hosts-monitor.service (saved in `/opt/hosts-monitor`)
- [x] Ban-Rule add: username
- [x] Always-Allow: ip @ /etc/hosts.allow
- [x] show the /etc/hosts.deny status
- [ ] show ip status: add `--oneline` argument
- [ ] `stat` : summary the ip (1) login times (2) login username (3) current status in report
- [ ] ban list
