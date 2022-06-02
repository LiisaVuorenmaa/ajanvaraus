***settings***
Resource  ../resource/ajanvaraus.resource.robot

***Test cases***
Open Terveystalo's appointment website and make an appointment
   Given that we have a chrome browser open 
   when navigating to terveystalo’s appointment site 
   Then we have an appointment page open and page contains correct links, texts and elements 
   When we press the “Varaa aika itsellesi” button 
   Then the dropdown menu opens below the button and contains correct texts on the menu buttons  
   When we press the “Yksityisasiakas” button 
   Then we have moved to a private customer appointment site and page contains correct links and elements 
   When we select current date from calendar and "from" and "to" times 
   When we select first free doctor from the list
   Then the page with a summary of your appointment will open  


