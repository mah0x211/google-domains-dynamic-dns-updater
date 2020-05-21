# google-domains-dynamic-dns-updater

Dynamic DNS update script for google domains.

## Installation

clone this repository to your host's `/usr/local/etc` directory.

```sh
$ git -C /usr/local/etc clone https://github.com/mah0x211/google-domains-dynamic-dns-updater.git
```

please modify `update.sh` script to set your `USERNAME`, `PASSWORD` and `HOSTNAME` for google domains.

- `USERNAME`: generated username in dynamic dns record.
- `PASSWORD`: generated password in dynamic dns record.
- `HOSTNAME`: hostname to be updated.

NOTE: please refer to https://support.google.com/domains/answer/6147083 for more details.

```sh
USERNAME="your-username"
PASSWORD="your-password"
HOSTNAME="your-domain-name"
# commented out if you have an IPv6 address
#IP="myip=$(curl -s https://domains.google.com/checkip)"
URL="https://domains.google.com/nic/update?hostname=${HOSTNAME}&${IP}"
curl --user "${USERNAME}:${PASSWORD}" -s $URL
```

create the following symbolic links of the systemd service files in `/etc/systemd/system` directory and then register and start services.

**google-domains-dynamic-dns-updater.service**

this service executes the `update.sh` script.

```sh
$ sudo ln -s /usr/local/etc/google-domains-dynamic-dns-updater/google-domains-dynamic-dns-updater.service /etc/systemd/system/
$ sudo systemctl enable google-domains-dynamic-dns-updater.service
$ sudo systemctl start google-domains-dynamic-dns-updater.service
```

**google-domains-dynamic-dns-updater.timer**

this service executes the `google-domains-dynamic-dns-updater.service` every `30` minites.

```sh
$ sudo ln -s /usr/local/etc/google-domains-dynamic-dns-updater/google-domains-dynamic-dns-updater.timer /etc/systemd/system/
$ sudo systemctl enable google-domains-dynamic-dns-updater.timer
$ sudo systemctl start google-domains-dynamic-dns-updater.timer
```
