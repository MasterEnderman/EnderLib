import os
import sys

from elib import *

def convertString(path):
    """convert path between WINDOWS and LINUX"""
    if ("win" in sys.platform):
        return path.replace("/","\\")
    elif ("linux" in sys.platform):
        return path.replace("\\","/")

def completePath(path):
    """returns the correct path to the generated files"""
    return os.getcwd() + convertString(path)

def checkDirectory(path,logger):
    """check if the required directories exist and creates them if needed"""
    newPath = completePath(path)
    if not os.path.exists(newPath):
        os.makedirs(newPath)
        if (logger):
            print("Did not found required directories. Creating them...")
    else:
        if (logger):
            print("Found the required directories!")