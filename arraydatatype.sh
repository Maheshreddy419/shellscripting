#!/bin/bash

#Array means which will store multiple values in a single variable

MOVIES=("HIT3" "COUT" "RETRO" "DON")

#to get the first movie
echo "First Movie: ${MOVIES[0]}"

#to get Third movies
echo "Third Movie: ${MOVIES[3]}"

#to get All movies
echo "All Movie: ${MOVIES[@]}"