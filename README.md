# tesena_test
Basic scripting test in Robot Framework

### What does this script do?
- visits Alza.cz eshop
- finds all mobile phones of Xiaomi brand
- opens detail information about 2nd product from (list) of found products
- saves two variables (one for the product name; second for product price)

### How to use:
- have Python with robotframework installed
- have chromedriver saved and added to PATH
- open shell, get into "tesena_test" directory
- run "python3 run_tests.py"
- reports are stored in "./reports" directory

## Written on LINUX, should work on Win as well"

###### PS: much cooler would be to use headless chrome, but it is messing with locators :()
