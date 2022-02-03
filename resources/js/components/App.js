import React from "react";

import ReactDOM from "react-dom";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import Layout from "./RoutePages/Layout";
import Home from "./RoutePages/Home";
import Blogs from "./RoutePages/Blogs";
import Contact from "./RoutePages/Contact";
import NoPage from "./RoutePages/NoPage";

export default class App extends React.Component {
    state = {};
    render() {
        return (
            <BrowserRouter basename="/Exercise/React-Laravel-Porject">
                <Routes>
                    <Route path="/" element={<Layout />}>
                        <Route index element={<Home />} />
                        <Route path="blog" element={<Blogs />} />
                        <Route path="contact" element={<Contact />} />
                        <Route path="*" element={<NoPage />} />
                    </Route>
                </Routes>
            </BrowserRouter>
        );
    }
}

if (document.getElementById("app")) {
    ReactDOM.render(<App />, document.getElementById("app"));
}
