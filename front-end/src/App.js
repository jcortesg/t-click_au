import React, {useState} from 'react';

import './App.scss';
import Search from './components/search'

const App = () => {
  const [loading, setLoading] = useState(false);
  const [cars, setCars] = useState([]);

  const sendRequest = async (values) =>{
    setCars([])
    setLoading(true)
    const response = await fetch(
      `http://localhost:3000/vehicles?${values.option}=${values.value}`, {
        headers: {
          'Access-Control-Request-Method': '*',
          'Content-Type': 'application/json'
        }
      });
    const body = await response.json();
    console.log(body)
    
    //para poder ver el loading
    await new Promise(resolve => setTimeout(resolve, 3000));

    setCars(body)
    setLoading(false)
  }
  

    return (
      <div className="App h-100">
        <div className="container my-5 h-100">
          <div className="row">
            <Search handleSubmit={(values) => sendRequest(values)}/>
            {cars.map((car, index) =>(
              <div className="col-md-12">
                <ul>
                  <li> <strong>MODEL NAME:</strong>{car.vehicle_model.name}</li>
                  <li><strong>ID:</strong>{car.id}</li>
                  <li><strong>YEAR:</strong>{car.year}</li>
                  <li><strong>MILEAGE:</strong>{car.mileage}
                  </li>
                </ul>

              </div>
            ))}
            { loading && (
              <div class="row justify-content-md-center">
                <div class="lds-circle"><div></div></div>
              </div>
            ) }
          </div>
        </div>
      </div>
    );
}

export default App;
