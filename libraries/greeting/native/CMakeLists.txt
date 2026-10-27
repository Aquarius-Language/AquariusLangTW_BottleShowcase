cmake_minimum_required(VERSION 3.20)
project(bottle_greeting C)
include(AquariusLibrary)
aqua_add_library(bottle_greeting SOURCES library.c)
