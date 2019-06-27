#!usr/bin/python3

from os import system
from robot import run


def run_robot():
    tests_path = 'src'
    output_path = './reports'
    run(tests_path, output_path)


def main():
    run_robot()


if __name__ == '__main__':
    main()
