#!/usr/bin/python2
import re, os

def get_authinfo_login(machine):
    s = "machine %s login ([^ ]*) password ([^ ]*)" % (machine)
    p = re.compile(s)
    authinfo = os.popen("gpg -q -d ${HOME}/.authinfo.gpg").read().rsplit("\n")
    res = [i for i in [p.search(line) for line in authinfo] if i is not None]
    return res[0].group(1)

def get_authinfo_password(machine):
    s = "machine %s login ([^ ]*) password ([^ ]*)" % (machine)
    p = re.compile(s)
    authinfo = os.popen("gpg -q -d ${HOME}/.authinfo.gpg").read().rsplit("\n")
    res = [i for i in [p.search(line) for line in authinfo] if i is not None]
    return res[0].group(2)
