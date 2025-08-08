#login the page
username="name:username"
password="name:password"
login_btn="xpath://button[text()=' Login ']"


#requirement page check
requirement_link="xpath://span[text()='Recruitment']//parent::a"

#add candidate
Add_btn="xpath://button[text()=' Add ']"
firstname="name=firstName"
middlename="name=middleName"
lastname="name=lastName"
candidate_vacancy="xpath://label[text()='Vacancy']/following::div[1]"
candidate_vacancy_list=("xpath://div[@role='listbox']//span[text()='${VACANCY}']")
email="xpath://label[text()='Email']//parent::div//following-sibling::div//input[@placeholder='Type here']"
contact="xpath://label[text()='Contact Number']//parent::div//following-sibling::div//input[@placeholder='Type here']"
browse_btn="xpath://input[@type='file']"
canditate_key="xpath://input[@placeholder='Enter comma seperated words...']"
dateapplication="xpath://input[@placeholder='yyyy-dd-mm']"
textarea="xpath://label[text()='Notes']//following::div//textarea"
cancel_btn="xpath://button[text()=' Cancel ']"
save_btn="xpath://button[text()=' Save ']"

#empty check
fname="xpath://span[text()='Required']//preceding::input[@name='firstName']"
lname="xpath://span[text()='Required']//preceding::input[@name='lastName']"
emailcheck="xpath://span[text()='Required']//preceding::input[@placeholder='Type here']"