import React, {Fragment, useState, useEffect} from 'react';
import {toast} from "react-toastify";

//components
import InputTodo from "./todolist/InputTodo";
import ListTodo from "./todolist/ListTodo";

const Dashboard = ({setAuth}) => {
  const [name, setName] = useState("");
  const [allTodos, setAllTodos] = useState([]);
  const [todosChange, setTodosChange] = useState(false);

  async function getProfile() {
    try {
      const res = await fetch("http://localhost:5000/dashboard/", {
        method: "GET",
        headers: {token: localStorage.token}
      });

      const parseData = await res.json(); 
      // console.log(parseRes);
      setAllTodos(parseData);

      setName(parseData[0].user_name);
    } catch (err) {
      console.error(err.message)
    }
  } 

  useEffect(() => {
    getProfile();
    setTodosChange(false);
  }, [todosChange])

  const logout = (e) => {
    e.preventDefault();
    localStorage.removeItem("token");
    setAuth(false);
    toast.success("Logged out successfully!")
  }

  return (
    <Fragment>
      <div className="d-flex mt-5 justify-content-around">
        <h2>{name}'s Todo List</h2>
        <button className="btn btn-primary" onClick={e=>logout(e)}>Logout</button>
      </div>  
      <InputTodo setTodosChange={setTodosChange}/>
      <ListTodo allTodos={allTodos} setTodosChange={setTodosChange}/>
    </Fragment>
  )
}

export default Dashboard
