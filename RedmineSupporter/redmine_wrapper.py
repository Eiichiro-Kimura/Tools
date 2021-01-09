import datetime
import random

from redminelib import Redmine

import redmine_config

config = redmine_config.Config()


class __Base:

    def __init__(self):
        self.__stub_url = "https://www.google.com"

    @classmethod
    def create_ticket_no(cls):
        return random.randint(10000, 20000)

    @property
    def stub_url(self):
        return self.__stub_url


class RedmineWrapper(__Base):

    def __init__(self):
        super().__init__()

        self.__redmine = (None if config.is_debug else
                          Redmine(config.url, key=config.api_key, requests={'verify': False}))

    def get_issue(self, ticket_no):
        return IssueStub(ticket_no, True) if config.is_debug \
            else self.__redmine.issue.get(ticket_no, include=['children'])

    def get_time_entry(self, ticket_no):
        if config.is_debug:
            return TimeEntryStub(ticket_no)
        else:
            ret = self.__redmine.time_entry.new()
            ret.issue_id = ticket_no
            ret.spent_on = datetime.date.today()
            return ret


class IssueSetStub(__Base):

    def __init__(self):
        super().__init__()

        self.__issue_list = [
            IssueStub(self.create_ticket_no(), False),
            IssueStub(self.create_ticket_no(), False),
            IssueStub(self.create_ticket_no(), False)
        ]
        self.__index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.__index == len(self.__issue_list):
            raise StopIteration()

        ret = self.__issue_list[self.__index]
        self.__index += 1

        return ret


class IssueStub(__Base):

    def __init__(self, ticket_no, have_children):
        super().__init__()

        self.__id = ticket_no
        self.__subject = "テストチケット"
        self.__start_date = datetime.date.today()
        self.__due_date = self.__start_date + datetime.timedelta(days=2)
        self.__parent_issue_id = self.create_ticket_no()
        self.__children = IssueSetStub() if have_children else None

    @property
    def id(self):
        return self.__id

    @property
    def subject(self):
        return self.__subject

    @property
    def start_date(self):
        return self.__start_date

    @start_date.setter
    def start_date(self, value):
        self.__start_date = value

    @property
    def due_date(self):
        return self.__due_date

    @due_date.setter
    def due_date(self, value):
        self.__due_date = value

    @property
    def parent_issue_id(self):
        return self.__parent_issue_id

    @property
    def children(self):
        return self.__children

    @property
    def url(self):
        return self.stub_url

    def save(self):
        print("[IssueStub]save : start_date[%s], due_date[%s]" % (self.__start_date, self.__due_date))


class TimeEntryStub(__Base):

    def __init__(self, ticket_no):
        super().__init__()

        self.__issue_id = ticket_no
        self.__spent_on = datetime.date.today()
        self.__hours = None
        self.__comments = None
        self.__activity_id = None

    @property
    def hours(self):
        return self.__hours

    @hours.setter
    def hours(self, value):
        self.__hours = value

    @property
    def comments(self):
        return self.__comments

    @comments.setter
    def comments(self, value):
        self.__comments = value

    @property
    def activity_id(self):
        return self.__activity_id

    @activity_id.setter
    def activity_id(self, value):
        self.__activity_id = value

    def save(self):
        print("[TimeEntryStub]save : issue_id[%d], spent_on[%s], hours[%s], comments[%s], activity_id[%d]" %
              (self.__issue_id, self.__spent_on, self.__hours, self.__comments, self.__activity_id))
