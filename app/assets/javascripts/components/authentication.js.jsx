const { Route, Router, Link, browserHistory } = ReactRouter;

class Authentication extends React.Component {
  render () {
    return (
      <form>
        <Router history={browserHistory}>
          <Route path="login" component={Login} />
          <Route path="sign_up" component={Signup} />
        </Router>
      </form>
    );
  }
}

class Login extends React.Component {
  render () {
    return (
      <div>
        <Link to={"/login"}>Log in</Link>
        <Link to={"/sign_up"}>Sign up</Link>
        <div className="field">
          <label htmlFor={this.props.scope + '_email'}>Email</label>
          <input type="email" id={this.props.scope + '_email'} name={this.props.scope + '[email]'} />
        </div>
        <div className="field">
          <label htmlFor={this.props.scope + '_password'}>Password</label>
          <input type="password" id={this.props.scope + '_password'} name={this.props.scope + '[password]'} />
        </div>
      </div>
    )
  }
}

class Signup extends React.Component {
  render () {
    return (
      <div>
        <Link to={"/login"}>Log in</Link>
        <Link to={"/sign_up"}>Sign up</Link>
        <div className="field">
          <label htmlFor={this.props.scope + '_email'}>Email</label>
          <input type="email" id={this.props.scope + '_email'} name={this.props.scope + '[email]'} />
        </div>
        <div className="field">
          <label htmlFor={this.props.scope + '_password'}>Password</label>
          <input type="password" id={this.props.scope + '_password'} name={this.props.scope + '[password]'} />
        </div>
        <div className="field">
          <label htmlFor={this.props.scope + '_password_confirmation'}>Password</label>
          <input type="password" id={this.props.scope + '_password_confirmation'} name={this.props.scope + '[password_confirmation]'} />
        </div>
      </div>
    )
  }
}
