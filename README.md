# Install
- ``git clone https://github.com/jcortesg/t-click_au.git``
- ``cd t-click_au``
- ``bundle install``
- ``rails s``
- ``rake db:create && rake db:migrate && rake db:seed``
-  ``cd font-end`` ***(REACT PROJECT)***
- ``yarn && yarn install``
- ``yarn start``

# Test
- ``rspec``

# Enpoints

- POST http://localhost:3000/vehicle_models
  #### BODY
  ``
   {"vehicle_model": {
  "name": "Golf",
  "brand": "VW"
}}
  ``
- POST http://localhost:3000/vehicles
  #### BODY
  ``
  {
    "vehicle": {
        "brand": "VW",
        "model": "Golf",
        "year": "2020",
        "price": 100000,
        "mileage": 3000
    }
}
  ``
- GET http://localhost:3000/vehicles?model_name=Golf&mileage=0&price=100000&year=2019

