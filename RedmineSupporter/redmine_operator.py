import webbrowser

import date_time_calculator
import redmine_wrapper

redmine_wrapper = redmine_wrapper.RedmineWrapper()


class IssueRelation:

    def __init__(self, ticket_no):
        self.__issue = redmine_wrapper.get_issue(ticket_no)

    @property
    def issue(self):
        return self.__issue

    @property
    def parent(self):
        return self.__issue.parent if hasattr(self.__issue, "parent") else None

    @property
    def children(self):
        return self.__issue.children


class IssueDate:

    def __init__(self, ticket_no):
        self.__issue = redmine_wrapper.get_issue(ticket_no)

    def update(self, date_param):
        option_kind = date_param.option_kind
        option_value = date_param.option_value

        if "s" == option_kind:
            self.__update_start(option_value)
        elif "e" == option_kind:
            self.__update_end(option_value)
        elif "b" == option_kind:
            text_array = option_value.split()
            self.__update_both(text_array[0], text_array[1])
        elif "d" == option_kind:
            self.__update_delta(int(option_value))
        else:
            raise ValueError("[Date]update : option_kind Invalid")

    def __update_start(self, date_text):
        start_b_date = self.__get_b_date(True)
        end_b_date = self.__get_b_date(False)
        count = start_b_date.count(end_b_date)
        start_b_date.set(date_text)
        end_b_date = start_b_date.delta(count)

        self.__update(start_b_date, end_b_date)

    def __update_end(self, date_text):
        start_b_date = self.__get_b_date(True)
        end_b_date = self.__get_b_date(False)
        count = start_b_date.count(end_b_date)
        end_b_date.set(date_text)
        start_b_date = end_b_date.delta(-count)

        self.__update(start_b_date, end_b_date)

    def __update_both(self, start_date_text, end_date_text):
        start_b_date = self.__get_b_date(True)
        end_b_date = self.__get_b_date(False)
        start_b_date.set(start_date_text)
        end_b_date.set(end_date_text)

        self.__update(start_b_date, end_b_date)

    def __update_delta(self, value):
        start_b_date = self.__get_b_date(True)
        end_b_date = self.__get_b_date(False)
        count = start_b_date.count(end_b_date)
        start_b_date = start_b_date.delta(value)
        end_b_date = start_b_date.delta(count)

        self.__update(start_b_date, end_b_date)

    def __get_b_date(self, is_start):
        return date_time_calculator.BusinessDay(
            self.__issue.start_date if is_start else self.__issue.due_date
        )

    def __update(self, start_b_date, end_b_date):
        self.__issue.start_date = start_b_date.date
        self.__issue.due_date = end_b_date.date
        self.__issue.save()
        webbrowser.open(self.__issue.url)


class WorkTime:

    def __init__(self, ticket_no):
        self.__issue = redmine_wrapper.get_issue(ticket_no)
        self.__timeEntry = redmine_wrapper.get_time_entry(ticket_no)

    def update(self, work_time_param):
        self.__timeEntry.hours = work_time_param.hours
        self.__timeEntry.comments = work_time_param.comments
        self.__timeEntry.activity_id = work_time_param.activity_id
        self.__timeEntry.save()
        webbrowser.open(self.__issue.url)
