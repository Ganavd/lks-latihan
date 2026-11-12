import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./css/style.css";
import Index from "./pages/index";
import Detail from "./pages/detail";
import Create from "./pages/create";
import Edit from "./pages/edit";
import Login from "./pages/login";
import Register from "./pages/register";

const router = createBrowserRouter([
  {
    path: "/",
    element: <div>Hello World</div>,
  },

  {
    path: "/login",
    element: <Login />,
  },

  {
    path: "/register",
    element: <Register />,
  },

  {
    path: "/detail/:id",
    element: <Detail />,
  },

  {
    path: "/edit/:id",
    element: <Edit />,
  },

  {
    path: "/create",
    element: <Create />,
  },

  {
    path: "/index",
    element: <Index />,
  },
]);

const root = document.getElementById("root");

ReactDOM.createRoot(root).render(<RouterProvider router={router} />);
