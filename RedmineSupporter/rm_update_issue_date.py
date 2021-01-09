#!/usr/bin/env python
import sys

from redminelib.exceptions import ResourceNotFoundError

import redmine_operator
import redmine_param

date_param = redmine_param.IssueDateParam(sys.argv)

if date_param.is_valid_args:
    ticket_no = date_param.ticket_no

    try:
        redmine_operator.IssueDate(ticket_no).update(date_param)

        print('チケット番号[%d]を更新しました' % ticket_no)
    except ResourceNotFoundError:
        print('チケット番号[%d]を更新できませんでした' % ticket_no)
