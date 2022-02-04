import { Outlet, Link } from "react-router-dom";
import Footer from "./layout/Footer";
import Header from "./layout/Header";

const Layout = () => {
    return (
        <>
            <Header />

            <nav>
                <ul>
                    <li>
                        <Link to="/">Home</Link>
                    </li>
                    <li>
                        <Link to="/blog">Blogs</Link>
                    </li>
                    <li>
                        <Link to="/contact">Contact</Link>
                    </li>
                </ul>
            </nav>

            <Footer />
            {/* The <Outlet> renders the current route selected. */}
            <Outlet />
        </>
    );
};

export default Layout;
