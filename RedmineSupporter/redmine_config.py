class Config:

    def __init__(self):
        self.__is_debug = False
        self.__url = "https://redmine.rits-orange.jp/"
        self.__api_key = "a940f956f3874ce6923a49132f39ac041c7e2e4b"

    @property
    def is_debug(self):
        return self.__is_debug

    @property
    def url(self):
        return self.__url

    @property
    def api_key(self):
        return self.__api_key
