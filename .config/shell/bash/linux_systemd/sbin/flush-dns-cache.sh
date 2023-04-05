#!/bin/bash


resolvectl flush-caches
systemd-resolve --flush-caches


echo "Systemd resolvctl cache flushed"
