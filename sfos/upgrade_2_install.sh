#!/bin/bash

set -e

RELEASE=2.0.1.11

devel-su zypper clean -a
devel-su zypper ref -f

version --dup
# if above fails, try again
version --dup
