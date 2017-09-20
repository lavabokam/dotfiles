#! /usr/bin/env python2
import os, getpass
import libkeepass
import subprocess

gpg_file="/home/lava/dotfiles/keepassx.gpg"

def get_keepass_pw(dbpath, title="", username=""):
    if os.path.isfile(dbpath):
        with libkeepass.open(
                os.path.expanduser(dbpath),
##                password=getpass.getpass("Master password for '" + dbpath +    "': ")) as kdb:
                password=get_password_from_gpg()) as kdb:
            entry = kdb.tree.xpath(
                './/Entry'
                '/String/Key[.="Title"]/../Value[.="{title}"]/../..'
                '/String/Key[.="UserName"]/../Value[.="{username}"]/../..'
                '/String/Key[.="Password"]/../Value'.format(
                    title=title,
                    username=username
                )
            )[0]
            return entry.text
    else:
        print("Error: " + dbpath + " does not exist.")
        return

def get_password_from_gpg():
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", gpg_file]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
