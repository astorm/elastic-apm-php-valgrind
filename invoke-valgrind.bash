#!/bin/bash

valgrind --suppressions=./php74-default.supp --leak-check=full --show-leak-kinds=all --track-origins=yes php test.php
