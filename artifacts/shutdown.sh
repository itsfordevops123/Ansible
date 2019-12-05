#!/bin/sh

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------------------
# Stop script for the CATALINA Server
# -----------------------------------------------------------------------------

# Better OS/400 detection: see Bugzilla 31132
os400=false
case "`uname`" in
OS400*) os400=true;;
esac

# resolve links - $0 may be a softlink
PRG="$0"

# gsit:pkeyes: do NOT resolve sym-links ... breaks all sorts of shit
###while [ -h "$PRG" ] ; do
###  ls=`ls -ld "$PRG"`
###  link=`expr "$ls" : '.*-> \(.*\)$'`
###  if expr "$link" : '/.*' > /dev/null; then
###    PRG="$link"
###  else
###    PRG=`dirname "$PRG"`/"$link"
###  fi
###done

PRGDIR=`dirname "$PRG"`
EXECUTABLE=catalina.sh

# Check that target executable exists
if $os400; then
  # -x will Only work on the os400 if the files are:
  # 1. owned by the user
  # 2. owned by the PRIMARY group of the user
  # this will not work if the user belongs in secondary groups
  eval
else
  if [ ! -x "$PRGDIR"/"$EXECUTABLE" ]; then
    echo "Cannot find $PRGDIR/$EXECUTABLE"
    echo "The file is absent or does not have execute permission"
    echo "This file is needed to run this program"
    exit 1
  fi
fi

# gsit:pkeyes: source env setup
. ${PRGDIR}/setenv.sh

# gsit:pkeyes: touch shutdown flag
/bin/date >${HAWS_SHUTDOWN_FILE}

# gsit:pkeyes: write entry to runlog
/bin/echo "stopping: `/bin/date`" >>${HAWS_RUNLOG_FILE}
"$PRGDIR"/"$EXECUTABLE" stop ${HAWS_SHUTDOWN_WAIT_SECS} "$@"
l_result=$?
l_pid=n/a
[[ -r "${CATALINA_PID}" ]] && l_pid=`cat ${CATALINA_PID}`
/bin/echo "stopped: code=${l_result} pid=${l_pid} `/bin/date`" >>${HAWS_RUNLOG_FILE}

exit ${l_result}
