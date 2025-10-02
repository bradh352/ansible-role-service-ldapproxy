# LDAP Proxy Ansible role

Author: Brad House<br/>
License: MIT<br/>
Original Repository: https://github.com/bradh352/ansible-role-service-ldapproxy

## Overview

LDAP Proxy server using openldap with the ldap backend.  This will basically
forward requests to an upstream server.  It is used when the upstream server
doesn't have a predictable/fixed IP address such as when using an external
identity provider like Okta.  Using a proxy is used for security so the
sensitive network areas don't need to access the entire internet preventing
possible data exfiltration attacks.

## Variables

- `ldapproxy_server`: Required. Server for LDAP syncing of users / groups.
- `ldapproxy_suffix`: Required. The suffix, e.g. `dc=testenv,dc=bradhouse,dc=dev`
- `ldapproxy_binddn`: Required. Bind DN for requesting users/groups.
- `ldapproxy_bindpass`: Required. Bind DN's password for requesting
  users/groups.
- `ldapproxy_tls_hostname`: Hostname to use for TLS certificates, this may be
  provided via a virtual ip. Defaults to `inventory_hostname` if not specified.
- `ldapproxy_dns_email`: Required. Used for certbot to specify email to provider.
- `ldapproxy_dns_provider`: Required. DNS provider in use for performing the DNS-01
  challenge.  Valid values are currently: `godaddy`, `cloudflare`
- `ldapproxy_dns_apikey`: Required. API Key for the DNS provider to be able to create
  a TXT record for `_acme-challenge.{{ inventory_hostname }}`.  This API should
  be restricted to exactly that access and nothing more.  Use `Key:Secret` for
  Godaddy keys. For GoDaddy see some information here:
  https://community.letsencrypt.org/t/godaddy-dns-and-certbot-dns-challenge-scripts/210189

