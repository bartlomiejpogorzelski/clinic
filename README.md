# README
Ticket/app:
Create a simple appointment reservation system for a clinic that has the following functionalities:

    1. Allows browsing the list of patients
    2. Enables appointment reservation
    3 Allows browsing the list of appointments and editing or deleting appointments
    4. Provides the ability to display customer statistics
    5. Allows importing the list of patients from a CSV file


AD 1. The page with the list of patients should be divided into subpages. Simple filters allowing filtering by gender, last name should be added. There should be the ability to sort records alphabetically by last name and by birth date. We recommend not reinventing the wheel. The use of gems such as Ransack and pagy/kaminari/will_paginate is suggested.

AD 2. Reservation should be initiated from the user list. On the list, next to each patient record, there should be a "Add Appointment" button that leads to the appointment creation view. In the appointment creation view, it should be possible to choose a Doctor, select the appointment date, and enter the appointment price independently (assuming all prices are in PLN). We assume that appointments can be scheduled from Monday to Friday, between 8:00 AM and 4:00 PM. The appointment lasts 20 minutes, and two patients cannot be scheduled on the same day at the same time with the same doctor.

AD 3. On the list of appointments, each record should display the doctor's first and last name, patient's first and last name, price with currency. The list of patients should include a column with the number of reserved appointments. Clicking on this number should display a list of these appointments.

AD 4. We want the application to have a page where a bar chart showing statistics of patient births is visible. We are interested in a chart that shows how many patients were born in each year. Any JavaScript library for charts can be used.

AD 5. Attached is a generated list of patients. We want it to be possible to quickly import this list from the rake task and/or Rails console. The patient's date of birth and gender can be read from the PESEL numbers (details here: https://www.gov.pl/web/cyfryzacja/co-to-jest-numer-pesel-i-jak-sie-go-nadaje )
