import React, {Component} from "react";

import ReactDOM from "react-dom";


class App extends Component {
    state = {
        counter: 0,
    }
    IncrementCount = (value) => {
       let newCounter = this.state.counter + value;
       this.setState(
           {
            counter: newCounter,
           }
       )
    }

    DecrementCount = (value) =>{
        let newCounter = this.state.counter - value;
        this.setState(
            {
                counter:newCounter,
            }
        )
    }
    render() {
        return (
            <>
                <h1 className="mt-2">Count: {this.state.counter}</h1>
                <button className="btn btn-success" onClick={ () => this.IncrementCount(5)}>+</button>
                <button className="btn btn-danger" onClick={ () => this.DecrementCount(2)}>+</button>
            </>
        );
    }
}

export default App;

if (document.getElementById("app")) {
    ReactDOM.render(<App />, document.getElementById("app"));
}
