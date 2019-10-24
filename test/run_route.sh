##
# @file   run.sh
# @author Yibo Lin
# @date   Dec 2018
#
#!/bin/bash

# get script directory instead of execution directory
TOP_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
if [ -e "${TOP_SCRIPT_DIR}/color.sh" ]; then 
    source ${TOP_SCRIPT_DIR}/color.sh
fi 

if [ ! -n "$1" ]
then
  echo -e "${STATUS_PREFIX_COLOR}Usage:${NC} `basename $0` circuit techfile simple_techfile spacing_rule width_area_rule enclosure_rule well_contact_GDSII lef_file"
  return 
fi  

TOP_CIRCUIT=$1
TOP_CIRCUIT_NAME=$(basename ${TOP_CIRCUIT})
TOP_TECHFILE=$2
TOP_SIMPLE_TECHFILE=$3
TOP_SPACING_RULE_FILE=$4
TOP_WIDTH_AREA_RULE_FILE=$5
TOP_ENCLOSURE_RULE_FILE=$6
TOP_WELL_CON_GDS_FILE=$7
TOP_LEF_FILE=$8
TOP_RESULT_DIR=$9
TOP_WELL_CONTACT=${10}
TOP_SUB_CONTACT=${11}

# run analog routing 
echo -e "${STATUS_PREFIX_COLOR}${TOP_CIRCUIT_NAME}:${NC} analog routing"
source ${TOP_SCRIPT_DIR}/../routing/test/run_route.sh \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.wellgen.gds \
    ${TOP_RESULT_DIR}/DataTest/${TOP_CIRCUIT_NAME}.result.final \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.pin \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.wcon \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.sub \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.iopin \
    ${TOP_RESULT_DIR}/${TOP_CIRCUIT_NAME}.symnet \
    ${TOP_LEF_FILE} \
    ${TOP_TECHFILE} > /dev/null