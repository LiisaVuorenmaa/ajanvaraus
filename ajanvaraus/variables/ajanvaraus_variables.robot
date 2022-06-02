*** Variables ***
${url}    https://ajanvaraus.terveystalo.com/fi/  




${cookieBanner}   xpath://*[@id="root"]/div
${buttonAcceptCookies}   xpath:/html/body/div/div/div/div[2]/button[1]
${ajanvarausText}   Ajanvaraus
${valitseKenelleVaraatText}   Valitse kenelle varaat ajan
${pikalinkitText}   Pikalinkit
${hoitoaMyösEtänäText}   Hoitoa myös etänä
${buttonVaraaAikaItsellesi}   xpath://*[@id="book-for-yourself-btn"]
${dropDownVaraaAikaItsellesi}   xpath://*[@id="book-for-yourself-content"]
${listTextsYksitysiasiakas}   Yksityisasiakas
${listTextsTyöterveysasiakas}   Työterveysasiakas
${listTextsVakuutus}   Vakuutus
${yksityisasiakasButton}   xpath:/html/body/div[1]/div/main/div[1]/div/div/div[1]/div/div/ul/li[1]/a
${inputPalveluTaiAsiantuntijanNimi}   xpath://*[@id="select-service-or-specialist-popup"]
${inputValueYleislääkäri}   Yleislääkäri
${inputToimipaikka}   xpath://*[@id="select-location-popup"]    
${inputValueHelsinki}   Helsinki
${doctorsListElement}   xpath://*[@id="root"]/div/main/div[1]/section/ul

${listElementPalveluTaiAsiantuntija}   xpath://*[@id="select-service-or-specialist-popup-listbox"]
${listElementToimipaikka}   xpath://*[@id="select-location-popup-listbox"]
${buttonTakaisin}    xpath://*[@id="select-location-modal-full"]/div/div[2]/div[1]/button
${pageHeader}   xpath://*[@id="root"]/div/main/div[1]/section/aside/button/span
${fromTimeInput}   xpath://*[@id="fromTime"] 
${toTimeInput}   xpath://*[@id="toTime"] 
${toTimeToSelect}   14:00
${fromTimeToSelect}   14:00

${listItemFirstFreeDoctor}   xpath://html/body/div[1]/div/main/div[1]/section/ul/li[1]/a/div[2]/div
${textFieldreservedTime}   xpath://*[@id="root"]/div/main/div[1]/div/div[1]/div[1]/span[2]
${summaryBoxElement}   xpath://*[@id="root"]/div/main/div[1]/div