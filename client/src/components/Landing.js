import React from 'react'
import {Link} from 'react-router-dom'

const Landing = () => {
  return (
    <div className="bg-light p-5 rounded-lg m-3 mt-5">
      <h1 className="display-4">Welcome to Todo City!</h1>
      <p className="lead">Sign In and Start building your todo list!</p>
      <hr className="my-4"/>
      <p>Start to record your todos</p>
      <Link to="/login" className="btn btn-primary">Login</Link>
      <Link to="/register" className="btn btn-primary ms-3">Register</Link> 
    </div>
  )
}

export default Landing
