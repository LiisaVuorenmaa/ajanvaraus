***settings***

Library   Selenium2Library
Library   OperatingSystem
Library   String
Library   Collections
Library   DateTime
Library   Process
Resource  ../variables/ajanvaraus_variables.robot
#Resource  cookie_handling.resource.robot
Resource  headless_browser.resource.robot

Documentation       
...                 
...                 pip install robotframework-selenium2library
...                 run with: 
...                 cd test_cases
...                 python -m robot ajanvaraus.robot
...               
                 

***keywords***
 
Given that we have a chrome browser open 
   open headless chrome

when navigating to terveystalo’s appointment site 
   Go To    ${url}

Then we have an appointment page open and page contains correct links, texts and elements
  page should contain   ${ajanvarausText}   ${valitseKenelleVaraatText}   
  page should contain    ${pikalinkitText}   ${hoitoaMyösEtänäText} 


When we press the “Varaa aika itsellesi” button
   click element   ${buttonVaraaAikaItsellesi} 

Then the dropdown menu opens below the button and contains correct texts on the menu buttons 
   element should contain   ${dropDownVaraaAikaItsellesi}   ${listTextsYksitysiasiakas}  ${listTextsTyöterveysasiakas}   ${listTextsVakuutus} 

When we press the “Yksityisasiakas” button
   click element   ${yksityisasiakasButton} 

Then we have moved to a private customer appointment site and page contains correct links and elements 
   wait until element is visible   ${inputPalveluTaiAsiantuntijanNimi}
   wait until element is visible   ${doctorsListElement} 
   ${inputServicePlaceHolder}   get value   ${inputPalveluTaiAsiantuntijanNimi}
   should be equal   ${inputServicePlaceHolder}   ${inputValueYleislääkäri}
    sleep   8s
   ${inputLocationPlaceHolder}   get value   ${inputToimipaikka}
   should be equal   ${inputLocationPlaceHolder}   ${inputValueHelsinki}
    
   ${currentDay}    Evaluate    '{dt.day}.{dt.month}.'.format(dt=datetime.datetime.now())    modules=datetime
   
   page should contain   Palvelu tai asiantuntijan nimi   Toimipaikka, kaupunki tai etävastaanotto
   page should contain   Yleislääkäri
   page should contain   Aikaisintaan klo   Viimeistään klo
   Wait until page contains   Tänään ${currentDay}
   
 When we select current date from calendar and "from" and "to" times
     ${currentDay}    get current date
     ${selectedBookingDate}=   add time to date   ${currentDay}   1 days 
     ${formatDate}=   fetch from left  ${selectedBookingDate}   ${SPACE}
     log   ${selectedBookingDate}
     ${tomorrow}=   set variable   xpath://*[@id="${formatDate}"] 
     Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     click element   ${tomorrow}

     #Execute JavaScript  document.getElementById('fromTime').value='${fromTimeToSelect}'
     #Execute JavaScript  document.getElementById('toTime').value='${toTimeToSelect}'

  
   ${newId}=   set variable   8                                        
   assign id to element   ${fromTimeInput}    ${newId}                                                                                                     
   sleep   5s
   PRESS KEYS   ID:${newId}   ${fromTimeToSelect}
   sleep   5s

   ${newId2}=   set variable   9                                        
   assign id to element   ${toTimeInput}    ${newId2}                                                                                                     
   sleep   5s
   PRESS KEYS   ID:${newId2}   ${toTimeToSelect}
   sleep   5s
  

     capture page screenshot
     Execute JavaScript    window.scrollTo(700, 0)
     sleep   15s
 When we select first free doctor from the list    
     click element   ${listItemFirstFreeDoctor}
 Then the page with a summary of your appointment will open 

    wait until element is visible   ${summaryBoxElement}  
    page should contain   Valitsemasi aika
    ${checkTime}   get text   ${textFieldreservedTime} 
    ${ourTime}   fetch from right   ${checkTime}   ${SPACE}
    capture page screenshot
    ${formatSelectedTime}   replace string   ${toTimeToSelect}   :   . 
    
    Should Be True    '${ourTime}'=='${formatSelectedTime}'
    

      