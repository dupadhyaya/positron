#tables from pdf

#!pip install tabula-py
#!pip install tabulate


from tabula import read_pdf
from tabulate import tabulate
import os
os.listdir('/Users/du/dup/audata/ranking/NIRF/pdf/')
file1 = '/Users/du/dup/audata/ranking/NIRF/pdf/IR-V-U-0104.pdf'
#reads table from pdf file
df = read_pdf(file1,pages="all") #address of pdf file

print(tabulate(df))


#!pip install camelot-py
#!pip install cv
#!pip install opencv-python
import tkinter
import camelot
abc = camelot.read_pdf(file1)
abc
print(abc[0].df)


#plumber !#####
#!pip install pdfplumber
import pdfplumber

#------ 
#!pip install pymupdf
import pymupdf

from multi_column import column_boxes

#ghost
from ctypes.util import find_library
find_library('gs')
#

!pip install excalibur-py
