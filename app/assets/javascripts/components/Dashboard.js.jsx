class Dashboard extends React.Component {
  constructor(props) {
    super(props);
    this.newRequest = this.newRequest.bind(this);
    this.state = { request: [] };
  }
  componentWillMount(){
    $.ajax({
      url: '/request',
      type: 'GET'
    }).success( data => {
      this.setState({ requests: data });
    });
  }
  newRequest(){
    $.ajax({
      url: '/request',
      type: 'POST',
      data: {request: {title: this.refs.newRequest.value}}
    }).success( data => {
      let requests = this.state.requests;
      request.unshift(data.request);
      this.refs.newRequest.value = null;
      this.setState({request: request});
    });
  }
  render() {
    let request = this.state.request.map(request => {
      let key = `request-${request.title}`;
      return( <Request key={key} {...request} />);
    });
    return(
            <div className='container center'>
              <div className='row col s12 m8 offset-m2'>
                <div id='profile'>
                  <p>Welcome, {this.userFirstName}!  </p>
                </div>
                <div id='quotes'>
                  <h1><strong>Requests</strong></h1>
                  <hr />
                  <p>{this.userRequest}</p>
                  // <p><strong>Pending Requests:</strong></p>
                  // <p>{this.userPendingRequests}</p>
                  // <p><strong>Completed Requests:</strong></p>
                  // <p>{this.userCompletedRequests}</p>
                  <input placeholder="Make A New Request" ref='newRequest' autoFocus={true} /> 
                  <button className='btn' onClick={this.newRequest}>New Request</button>
                  <div className='card-action'>
                    <a onClick={this.userRequest}>{this.props.title}</a>
                  </div>
                  <div className= 'card blue-grey darken-1'>
                    <div className= 'card-content white-text'>
                      <p>{this.props.info}</p>
                      {request}
                    </div>
                  </div>
                </div>
              </div>
            </div>);
  }
}