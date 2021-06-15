import React, {useState} from 'react';

const Search = ({handleSubmit}) => {
  const [option, setOption] = useState();
  const [value, setValue] = useState('model_name');
  const [error, setError] = useState();
  
  const handleSend = (e) => {
    e.preventDefault();
    if(value && option){
      handleSubmit({value, option})
    }else {
      setError("all field required")
    }
  }

  return(
    <div className="input-group mb-3">
      <input type="text" class="form-control col-md-8" 
      onChange={e => setValue(e.target.value)}/>
      <select className="form-select" 
        value={option}
        onChange={e => setOption(e.currentTarget.value)}>
        <option value="model_name">model</option>
        <option value="mileage">mileage</option>
        <option value="year">year</option>
        <option value="price">price</option>
      </select>   
      <button 
        className="btn btn-outline-secondary" 
        onClick={(e) => handleSend(e)}
        type="button">
        Button
      </button>
    </div>
  )
}

export default Search
