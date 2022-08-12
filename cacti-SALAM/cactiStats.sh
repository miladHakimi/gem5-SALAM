#!/bin/bash

CACHE_SIZE=$1
LINE_SIZE=64
ASSOCIATIVITY=1
RW_PORTS=$2
EXCL_READ_PORTS=0
EXCL_WRITE_PORTS=0
SINGLE_ENDED_READ_PORTS=0
SEARCH_PORTS=0
BANKS=1
TECH_NODE=45
OUTPUT_WIDTH=512
SPECIFIC_TAG=0
TAG_WIDTH=0
ACCESS_MODE=2
CACHE=0
MAIN_MEM=0
OBJ_FUNC_DELAY=0
OBJ_FUNC_DYNAMIC_POWER=0
OBJ_FUNC_LEAKAGE_POWER=100
OBJ_FUNC_CYCLE_TIME=0
OBJ_FUNC_AREA=0
DEV_FUNC_DELAY=20
DEV_FUNC_DYNAMIC_POWER=100000
DEV_FUNC_LEAKAGE_POWER=100000
DEV_FUNC_AREA=1000000
DEV_FUNC_CYCLE_TIME=1000000
ED_ED2_NONE=2
TEMP=300
WT=0
DATA_ARR_RAM_CELL_TECH_FLAVOR_IN=0
DATA_ARR_PERI_GLOBAL_TECH_FLAVOR_IN=0
TAG_ARR_RAM_CELL_TECH_FLAVOR_IN=0
TAG_ARR_PERI_GLOBAL_TECH_FLAVOR_IN=0
INTERCONNECT_PROJECTION_TYPE_IN=1
WIRE_INSIDE_MAT_TYPE_IN=1
WIRE_OUTSIDE_MAT_TYPE_IN=1
REPEATERS_IN_HTREE_SEGMENTS_IN=1
VERTICAL_HTREE_WIRES_OVER_THE_ARRAY_IN=0
BROADCAST_ADDR_DATAIN_OVER_VERTICAL_HTREES_IN=0
PAGE_SIZE_BITS_IN=0
BURST_LENGTH_IN=8
INTERNAL_PREFETCH_WIDTH_IN=8
FORCE_WIRETYPE=1
WIRETYPE=30
FORCE_CONFIG=0
NDWL=1
NDBL=1
NSPD=0
NDCM=1
NDSAM1=0
NDSAM2=0
ECC=0

cd $M5_PATH/ext/mcpat/cacti

./cacti $CACHE_SIZE \
$LINE_SIZE \
$ASSOCIATIVITY \
$RW_PORTS \
$EXCL_READ_PORTS \
$EXCL_WRITE_PORTS \
$SINGLE_ENDED_READ_PORTS \
$SEARCH_PORTS \
$BANKS \
$TECH_NODE \
$OUTPUT_WIDTH \
$SPECIFIC_TAG \
$TAG_WIDTH \
$ACCESS_MODE \
$CACHE \
$MAIN_MEM \
$OBJ_FUNC_DELAY \
$OBJ_FUNC_DYNAMIC_POWER \
$OBJ_FUNC_LEAKAGE_POWER \
$OBJ_FUNC_CYCLE_TIME \
$OBJ_FUNC_AREA \
$DEV_FUNC_DELAY \
$DEV_FUNC_DYNAMIC_POWER \
$DEV_FUNC_LEAKAGE_POWER \
$DEV_FUNC_AREA \
$DEV_FUNC_CYCLE_TIME \
$ED_ED2_NONE \
$TEMP \
$WT \
$DATA_ARR_RAM_CELL_TECH_FLAVOR_IN \
$DATA_ARR_PERI_GLOBAL_TECH_FLAVOR_IN \
$TAG_ARR_RAM_CELL_TECH_FLAVOR_IN \
$TAG_ARR_PERI_GLOBAL_TECH_FLAVOR_IN \
$INTERCONNECT_PROJECTION_TYPE_IN \
$WIRE_INSIDE_MAT_TYPE_IN \
$WIRE_OUTSIDE_MAT_TYPE_IN \
$REPEATERS_IN_HTREE_SEGMENTS_IN \
$VERTICAL_HTREE_WIRES_OVER_THE_ARRAY_IN \
$BROADCAST_ADDR_DATAIN_OVER_VERTICAL_HTREES_IN \
$PAGE_SIZE_BITS_IN \
$BURST_LENGTH_IN \
$INTERNAL_PREFETCH_WIDTH_IN \
$FORCE_WIRETYPE \
$WIRETYPE \
$FORCE_CONFIG \
$NDWL \
$NDBL \
$NSPD \
$NDCM \
$NDSAM1 \
$NDSAM2 \
$ECC

cd $M5_PATH/cacti-SALAM

