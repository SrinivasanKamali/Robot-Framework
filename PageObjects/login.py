# login the page
username = "name:username"
password = "name:password"
login_btn = "xpath://button[text()=' Login ']"

# requirement page check
requirement_link = "xpath://span[text()='Recruitment']//parent::a"

# add candidate
Add_btn = "xpath://button[text()=' Add ']"
firstname = "name=firstName"
middlename = "name=middleName"
lastname = "name=lastName"
email = "xpath://label[text()='Email']//parent::div//following-sibling::div//input[@placeholder='Type here']"
contact = "xpath://label[text()='Contact Number']//parent::div//following-sibling::div//input[@placeholder='Type here']"
browse_btn = "xpath://input[@type='file']"
canditate_key = "xpath://input[@placeholder='Enter comma seperated words...']"
dateapplication = "xpath://input[@placeholder='yyyy-dd-mm']"
textarea = "xpath://label[text()='Notes']//following::div//textarea"
cancel_btn = "xpath://button[text()=' Cancel ']"
save_btn = "xpath://button[text()=' Save ']"

# empty check
fname = "xpath://span[text()='Required']//preceding::input[@name='firstName']"
lname = "xpath://span[text()='Required']//preceding::input[@name='lastName']"
emailcheck = "xpath://span[text()='Required']//preceding::input[@placeholder='Type here']"

# time sheet page
time_btn = "xpath://span[text()='Time']//parent::a"
timesheet_count = "xpath://div[@class='oxd-table-card']//div/div/div"

#punch in and out check
attenance_drop="xpath://span[text()='Attendance ']"
select_dropdown="xpath://a[text()='Punch In/Out']"
emp_dropdown="xpath://a[text()='Employee Records']"
date="xpath://input[@placeholder='yyyy-dd-mm']"
out_date="xpath://input[@placeholder='dd-mm-yyyy']"
time="xpath://input[@placeholder='hh:mm']"
text_area="xpath://textarea[@placeholder='Type here']"
out_btn="xpath://button[text()=' Out ']"
in_btn="xpath://button[text()=' In ']"

year="xpath://li[@class='oxd-calendar-selector-year']"
year_list="xpath://li[@class='oxd-calendar-dropdown--option']"
month="xpath://li[@class='oxd-calendar-selector-month']"
month_list="xpath://div[@class='oxd-calendar-selector-month-selected']//following::ul/li"
day="xpath://div[@class='oxd-calendar-dates-grid']//div/div"

#employeee attadence
emp_search="xpath://input[@placeholder='Type for hints...']"
emp_select="xpath://div[@role='listbox']/div/span[text()='James  Butler']"
view_btn="xpath://button[@type='submit']"
table_log="xpath://div[@class='oxd-table-cell oxd-padding-cell']"

