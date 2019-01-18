#!/usr/bin/env bash

# Given an urbit executable and a pill, create a zod pier.

source $stdenv/setup

find $src
echo urbit-runner -F zod -c $out -B $PILL
urbit-runner -F zod -c $out -B $PILL
