import requests
from bs4 import BeautifulSoup
import time
from selenium import webdriver
import pickle


# используем Selenium для входа на страницу
  try:
      driver = webdriver.Chrome(
          executable_path="Путь к драйверу",
          options=options
      )
      driver.get(url=project_url)
      time.sleep(1)

      # использование куки для входа на сайт
      for cookie in pickle.load(open(f"cookies", "rb")):
          driver.add_cookie(cookie)
      time.sleep(1)
      driver.refresh()
      time.sleep(3)
      try:
          # делаем клик на кнопку с телефоном
          driver.find_element_by_class_name('css-1pltt9a-BaseStyles').click()
      except Exception:
          pass

      with open(f"{project_name}.html", "w", encoding='utf-8') as file:
          file.write(driver.page_source)
  except Exception as ex:
      print(ex)
  finally:
      driver.close()
      driver.quit()
      
      
 # детали
    # если на сайте нет данной информации, в таблицу возвращаем "—"
    try:
        room = soup.find('ul', class_='css-sfcl1s').find(text=re.compile('Количество комнат')).split(':')[-1]
    except AttributeError:
        room = '—'
    try:
        area = soup.find('ul', class_='css-sfcl1s').find(text=re.compile('Этаж')).split(':')[-1]
    except AttributeError:
        area = '—'
    try:
        floor = soup.find('ul', class_='css-sfcl1s').find(text=re.compile('Общая площадь')).split(':')[-1]
    except AttributeError:
        floor = '—'
    try:
        layout = soup.find('ul', class_='css-sfcl1s').find(text=re.compile('Планировка')).split(':')[-1]
    except AttributeError:
        layout = '—'
