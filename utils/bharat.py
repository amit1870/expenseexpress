from bs4 import BeautifulSoup
import requests, random
from time import sleep
import urllib
import os

def read_url(url, format='soup'):
    sleep(random.randint(1,3))
    headers = {'Accept':'text/css,*/*;q=0.1',
        'Accept-Charset':'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
        'Accept-Encoding':'gzip,deflate,sdch',
        'Accept-Language':'en-US,en;q=0.8',
        'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36'}
    page = requests.get(url, headers = headers)
    page_content = page.content

    soup = BeautifulSoup(page_content,'html5lib')
    if(format=='str'):
        return str(soup)
    else:
        return soup

def get_states(country):
	soup = read_url(country)
	tbody = soup.findAll('tbody')[0]
	Flag = False
	states = []
	for tr in tbody:
		if Flag == False:
			header  = tr.findAll('th')
			cols = []
			for col in header:
				cols.append(col.contents)
			Flag = True
		else:
			td = tr.findAll('td')
			state = td[1].findAll('a')[0].contents[0]
			link = td[1].findAll('a')[0]['href']
			link = country + link[1:]
			count = td[2].contents[0]
			states.append((state, link, count))

	return states
			

def get_districts(state):
	soup = read_url(state)
	tbody = soup.findAll('tbody')[0]
	Flag = False
	districts = []
	for tr in tbody:
		if Flag == False:
			header  = tr.findAll('th')
			cols = []
			for col in header:
				cols.append(col.contents)
			Flag = True
			
		else:
			td = tr.findAll('td')
			district = td[1].findAll('a')[0].contents[0]
			link = td[1].findAll('a')[0]['href']
			link = "http://vlist.in" + link
			count = td[2].contents[0]
			districts.append((district, link, count))
	
	return districts

def get_tehsils(district):
	soup = read_url(district)
	tbody = soup.findAll('tbody')[0]
	Flag = False
	tehsils = []
	for tr in tbody:
		if Flag == False:
			header  = tr.findAll('th')
			cols = []
			for col in header:
				cols.append(col.contents)
			Flag = True
			
		else:
			td = tr.findAll('td')
			tehsil = td[1].findAll('a')[0].contents[0]
			link = td[1].findAll('a')[0]['href']
			link = "http://vlist.in" + link
			count = td[2].contents[0]
			tehsils.append((tehsil, link, count))
	
	return tehsils


def get_gaons(tehsil):
	soup = read_url(tehsil)
	tbody = soup.findAll('tbody')[0]
	Flag = False
	gaons = []
	for tr in tbody:
		if Flag == False:
			header  = tr.findAll('th')
			cols = []
			for col in header:
				cols.append(col.contents)
			Flag = True
			
		else:
			td = tr.findAll('td')
			gaon = td[1].findAll('a')[0].contents[0]
			link = td[1].findAll('a')[0]['href']
			link = "http://vlist.in" + link
			pincode = td[2].contents[0]
			gaons.append((gaon, link, pincode))
	
	return gaons
	