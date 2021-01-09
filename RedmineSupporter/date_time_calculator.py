import copy
import datetime


class BusinessDay:

    @classmethod
    def from_today(cls):
        return BusinessDay(datetime.date.today())

    @classmethod
    def from_text(cls, text):
        return BusinessDay(datetime.datetime.strptime(text, "%Y/%m/%d"))

    @property
    def date(self):
        return self.__date

    @property
    def is_business_day(self):
        return 0 <= self.__date.weekday() <= 4

    def __init__(self, date):
        self.__date = date

    def count(self, other):
        ret = 0

        if self.__date <= other.__date:
            start_b_date = copy.deepcopy(self)
            end_b_date = copy.deepcopy(other)
        else:
            start_b_date = copy.deepcopy(other)
            end_b_date = copy.deepcopy(self)

        while start_b_date.__date < end_b_date.__date:
            start_b_date = start_b_date.next()
            if start_b_date.is_business_day:
                ret += 1

        return ret

    def set(self, date_text):
        ret = BusinessDay.from_text(date_text)
        if not ret.is_business_day:
            ret = ret.next()
        self.__date = ret.__date

    def next(self, is_next=True):
        ret = copy.deepcopy(self)
        ofs = (1 if is_next else -1)

        while True:
            ret.__date += datetime.timedelta(days=ofs)
            if ret.is_business_day:
                break

        return ret

    def delta(self, value):
        ret = copy.deepcopy(self)

        if 0 == value:
            return ret
        else:
            is_next = (value > 0)
            rest_count = abs(value)

            while rest_count > 0:
                ret = ret.next(is_next)
                rest_count -= 1

            return ret
