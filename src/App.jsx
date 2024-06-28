import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  const handleClick = () => {
    fetch("http://localhost:5000/")
    .then(res => res.json())
    .then(data => console.log(data))
  }

  return (
    <>
      <h1>Hello, World</h1>
      <button onClick={handleClick}></button>
    </>
  )
}

export default App
