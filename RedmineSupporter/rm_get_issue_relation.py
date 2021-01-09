#!/usr/bin/env python
import sys

from redminelib.exceptions import ResourceNotFoundError

import redmine_operator
import redmine_param

issueRelationParam = redmine_param.IssueRelationParam(sys.argv)

if issueRelationParam.is_valid_args:
    ticket_no = issueRelationParam.ticket_no

    try:
        issueRelation = redmine_operator.IssueRelation(ticket_no)
        issue = issueRelation.issue
        parent = issueRelation.parent

        print('チケット : %d : %s' % (issue.id, issue.subject))

        if parent is not None:
            print('親チケット : %d' % parent.id)

        for child in issueRelation.children:
            print('子チケット : %d : %s' % (child.id, child.subject))
    except ResourceNotFoundError:
        print('チケット番号[%d]の情報を取得できませんでした' % ticket_no)
