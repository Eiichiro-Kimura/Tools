import os
import re

from abc import abstractmethod


class __Base:

    def __init__(self, args):
        self.__args_cnt = len(args)
        if not self.is_valid_args:
            print(self.help)

    @classmethod
    def search_ticket_no(cls):
        matched_list = re.findall(r'\d+', os.getcwd())
        if matched_list is None:
            raise ValueError("[__Base]__init__ : ticket_no NotFound")
        else:
            return int(matched_list[len(matched_list) - 1])

    @property
    def args_cnt(self):
        return self.__args_cnt

    @property
    @abstractmethod
    def help(self):
        pass

    @property
    @abstractmethod
    def is_valid_args(self):
        pass


class IssueRelationParam(__Base):

    def __init__(self, args):
        super().__init__(args)

        if self.is_valid_args:
            self.__ticket_no = self.search_ticket_no() if "-n" == args[1] else int(args[1])

    @property
    def help(self):
        return '''\
Usage:
 rm_get_issue_relation [ticketNo or option]

Option:
 -n
  チケット番号をディレクトリ名から検索'''

    @property
    def is_valid_args(self):
        return 2 == self.args_cnt

    @property
    def ticket_no(self):
        return self.__ticket_no


class IssueDateParam(__Base):

    def __init__(self, args):
        super().__init__(args)

        if self.is_valid_args:
            if 3 == self.args_cnt:
                self.__ticket_no = self.search_ticket_no()
                self.__option_kind = args[1][1:]
                self.__option_value = args[2]
            elif 4 == self.args_cnt:
                self.__ticket_no = int(args[1])
                self.__option_kind = args[2][1:]
                self.__option_value = args[3]

    @property
    def help(self):
        return '''\
Usage:
 rm_update_date [ticketNo] [option]

Option:
 -s "2019/09/14"
  開始日を指定日に移動
 -e "2019/09/14"
  期日を指定日に移動
 -b "2019/09/14 2019/09/20"
  開始日と期日を設定
 -d 10
  開始日を指定営業日数の分だけ移動'''

    @property
    def is_valid_args(self):
        return 3 == self.args_cnt or 4 == self.args_cnt

    @property
    def ticket_no(self):
        return self.__ticket_no

    @property
    def option_kind(self):
        return self.__option_kind

    @property
    def option_value(self):
        return self.__option_value


class WorkTimeParam(__Base):

    def __init__(self, args):
        super().__init__(args)

        if 4 == self.args_cnt:
            self.__ticket_no = self.search_ticket_no()
            self.__hours = args[1]
            self.__comments = args[2]
            self.__activityId = int(args[3])
        elif 5 == self.args_cnt:
            self.__ticket_no = int(args[1])
            self.__hours = args[2]
            self.__comments = args[3]
            self.__activityId = int(args[4])

    @property
    def help(self):
        return '''\
Usage:
 rm_update_worktime [ticketNo] [hours] [comments] [activityId]

Option:
 例）12345 2 "作業内容" 1
 　　チケット番号[12345]、[2]時間、コメント[作業内容]、活動[1]の作業時間を記録

ActivityId:
 15 : [inquiries]調査/相談/報告
 16 : [inquiries]対応/修正
 13 : Translate
  8 : Create document
  9 : Develope
 12 : Fix bug
 11 : Write testcase
 10 : Perform test
 14 : Review'''

    @property
    def is_valid_args(self):
        return 4 == self.args_cnt or 5 == self.args_cnt

    @property
    def ticket_no(self):
        return self.__ticket_no

    @property
    def hours(self):
        return self.__hours

    @property
    def comments(self):
        return self.__comments

    @property
    def activity_id(self):
        return self.__activityId
