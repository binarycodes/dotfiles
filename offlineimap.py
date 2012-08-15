#!/usr/bin/python2
import re, os

def get_authinfo_password(machine, num):
    s = "machine %s login ([^ ]*) password ([^ ]*)" % (machine)
    p = re.compile(s)
    authinfo = os.popen("gpg -q -d /home/sujoy/.authinfo.gpg").read().rsplit("\n")
    res = p.search(authinfo[num])
    return res.group(2)


def get_authinfo_login(machine, num):
    s = "machine %s login ([^ ]*) password ([^ ]*)" % (machine)
    p = re.compile(s)
    authinfo = os.popen("gpg -q -d /home/sujoy/.authinfo.gpg").read().rsplit("\n")
    res = p.search(authinfo[num])
    return res.group(1)
