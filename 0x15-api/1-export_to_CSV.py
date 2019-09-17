#!/usr/bin/python3
"""1. Export to CSV"""

import csv
import requests
from sys import argv


if __name__ == '__main__':
    """Gather data"""
    get_todo = requests.get('https://jsonplaceholder.typicode.com/todos',
                            params={'userId': argv[1]})
    users_todo = get_todo.json()

    get_user = requests.get("https://jsonplaceholder.typicode.com/users/{}".
                            format(argv[1]))
    user_name = get_user.json().get('username')

    with open('{}.csv'.format(argv[1]), 'w') as csv_file:
        writer_csv = csv.writer(csv_file, quoting=csv.QUOTE_ALL)
        for mv in users_todo:
            writer_csv.writerow([argv[1],
                                user_name,
                                mv.get("completed"),
                                mv.get("title")])
