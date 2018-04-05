# Hosts-Monitor

#### Version 1.0

The light service to manage suspicious hosts.  This repository contains:

* **hosts-protect** : 
    the main daemon to ban the suspect per hour. 

    * Default report: `/home/hosts-monitor.report`
    * Default shortcut: `/etc/ssh/sshd_banner`

* **hosts-monitor** : 
    user command to easily list/search log in hosts-monitor.report, ban/unban specific ips manually (root only), and control `hosts-protect` service to ON/OFF (root only).
    
    * log path: `/home/hosts-monitor.report` 
    * ban-list: `/etc/hosts.deny` (the only ban-list accessed.  If you unban unsuccessfully, check whether another ban-list is running or not.)

## Setup

    $ sudo ./setup

## Usage Examples

   1. list/search log

```sh
$ hosts-monitor list    # show today's log
$ hosts-monitor list \(root\|admin\)    # show log which contains `root` or `admin`
$ hosts-monitor list --status ban       # show the ban list
$ hosts-monitor list --help
```

   2. ban/unban ip [root only]

```sh
$ sudo hosts-monitor ban 1.1.1.1    # add 1.1.1.1 into /etc/hosts.deny
$ sudo hosts-monitor ban 1.1.1.1 2.2.2.2   # allow to input multiple ips
$ sudo hosts-monitor unban 2.2.2.2  # remove 2.2.2.2 from /etc/hosts.deny
$ hosts-monitor ban --help
```

   3. control `hosts-protect` [root only]

```sh
$ sudo hosts-monitor service stop       # disable hosts-protect
$ sudo hosts-monitor service restart    # enable hosts-protect and run it
$ hosts-monitor service --help
```

Type `hosts-monitor help` to see the detailed description.
