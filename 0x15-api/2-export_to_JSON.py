#!/usr/bin/python3
"""0. Gather data from an API"""

import json
import requests
from sys import argv


if __name__ == '__main__':
    """Gather data"""
    get_user = requests.get("https://jsonplaceholder.typicode.com/users/{}".
                            format(argv[1]))
    user_name = get_user.json().get('name')

    get_todo = requests.get('https://jsonplaceholder.typicode.com/todos',
                            params={'userId': argv[1]})
    users_todo = get_todo.json()

    list_task = []
    for mv in users_todo:
        list_task.append({'task': mv.get('title'),
                          'completed': mv.get('completed'),
                          'username': user_name})

    dic_json = {argv[1]: users_todo}

    with open('{}.json'.format(argv[1]), 'w') as jsonfile:
        json.dump({argv[1]: list_task}, jsonfile)
