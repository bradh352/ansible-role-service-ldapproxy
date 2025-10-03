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
- `ldapproxy_tlscert`: Required. Path to tls certificate.
- `ldapproxy_tlskey`: Required. Path to tls private key.
