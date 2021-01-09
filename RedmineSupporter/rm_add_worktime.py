#!/usr/bin/env python
import sys

from redminelib.exceptions import ResourceNotFoundError

import redmine_operator
import redmine_param

workTimeParm = redmine_param.WorkTimeParam(sys.argv)

if workTimeParm.is_valid_args:
    ticket_no = workTimeParm.ticket_no

    try:
        redmine_operator.WorkTime(ticket_no).update(workTimeParm)

        print('チケット番号[%d]に記録しました' % ticket_no)
    except ResourceNotFoundError:
        print('チケット番号[%d]に記録できませんでした' % ticket_no)
