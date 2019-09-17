#!/usr/bin/python3
"""0. Gather data from an API"""

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

    count_done = 0
    done_tasks = []
    all_tasks = len(users_todo)
    for mv in users_todo:
        if mv.get('completed') is True:
            count_done += 1
            done_tasks.append(mv.get("title"))
    print('Employee {} is done with tasks({}/{}):'.format(
                                                    user_name,
                                                    count_done,
                                                    all_tasks))
    for it in done_tasks:
        print("\t {}".format(it))
