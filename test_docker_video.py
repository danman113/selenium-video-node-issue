import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class ceralTest(unittest.TestCase):
	def setUp(self):
		browser = DesiredCapabilities.CHROME
		print browser
		self.driver = webdriver.Remote(
			command_executor="http://192.168.99.100:4444/wd/hub",
			desired_capabilities=browser
		)
		#self.driver = webdriver.Firefox()
	def testSearchForCereal(self):
		driver = self.driver
		driver.get("http://google.com")
		elem = driver.find_element_by_name("q")
		elem.send_keys("cereal")
		elem.submit()
		try:
			wait = WebDriverWait(driver,3)
			wait.until(EC.title_contains("cereal"))
		finally:
			self.assertIn("cereal", driver.title)
		try:
			driver.get_screenshot_as_file("test.png")
		except:
			print "Error saving screenshot"
		print driver.title
	def tearDown(self):
		self.driver.quit()

if __name__ == "__main__":
	unittest.main()
