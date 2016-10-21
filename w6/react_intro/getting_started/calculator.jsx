import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // more stuff here
    this.state = {result: 0, num1: '', num2: ''};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.sub = this.sub.bind(this);
    this.mul = this.mul.bind(this);
    this.div = this.div.bind(this);
    this.reset = this.reset.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({ num1: e.currentTarget.value});
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({ num2: e.currentTarget.value});
  }

  add(e) {
    e.preventDefault();
    let [num1, num2] = [parseInt(this.state.num1), parseInt(this.state.num2)];
    this.setState({ result: num1 + num2 });
  }

  sub(e) {
    e.preventDefault();
    let [num1, num2] = [parseInt(this.state.num1), parseInt(this.state.num2)];
    this.setState({ result: num1 - num2 });
  }

  mul(e) {
    e.preventDefault();
    let [num1, num2] = [parseInt(this.state.num1), parseInt(this.state.num2)];
    this.setState({ result: num1 * num2 });
  }

  div(e) {
    e.preventDefault();
    let [num1, num2] = [parseInt(this.state.num1), parseInt(this.state.num2)];
    this.setState({ result: num1 / num2 });
  }

  reset(e) {
    e.preventDefault();
    this.setState( { result: 0, num1: '', num2: ''});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1}type="text" name='text1' value={this.state.num1}></input>
        <br/>
        <input onChange={this.setNum2}type="text" name='text2' value={this.state.num2}></input>
        <br/>
        <h3>Operations</h3>
        <button onClick={this.add}>+</button>
        <button onClick={this.sub}>-</button>
        <button onClick={this.mul}>*</button>
        <button onClick={this.div}>/</button>
        <br/>
        <button onClick={this.reset}>AC</button>
      </div>
    );
  }
}

export default Calculator;
