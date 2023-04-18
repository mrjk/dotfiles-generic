# User systemd

This page describes how to integrate with systemd at user level.

## Enabling user's systemd

Systemd linger for user must be enabled at the OS level:
```
sudo loginctl enable-linger $USER
```
