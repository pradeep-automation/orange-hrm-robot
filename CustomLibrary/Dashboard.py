import time

from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword, library

@library
class Dashboard:
    def __init__(self):
        self.sellib = BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def get_the_dashboard_menu_items(self, locator):
        all_menu = self.sellib.get_webelements(locator)
        for menu in all_menu:
            BuiltIn().log_to_console(menu.text)

    @keyword
    def click_on_dashboard_menu_item(self, locator, item):
        all_menu = self.sellib.get_webelements(locator)
        index = 1
        for menu in all_menu:
            if menu.text == item:
                self.sellib.click_element(f"xpath:(//ul[@class='oxd-main-menu']/li)[{index}]")

                break
            index += 1








