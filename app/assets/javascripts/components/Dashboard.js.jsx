class Dashboard extends React.Component {
  constructor(props) {
    super(props);
    this.newRequest=this.newRequest.bind(this);
  }
  componentWillMount(){
    $.ajax({
      url: '/requests',
      type: 'GET',
      dataType: 'JSON',
      data: { location: location }
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
      requests.push(data.request);
      this.setState({requests: requests});
    });
  }
  render() {
    let requests = this.state.requests.map(request => {
      let key = `request-${request.title}`;
      return( <Request key={key} {...request} />);
    });
    return(
            <div className='container center'>
              <div className='row col s12 m8 offset-m2'>
                <div className= 'card blue-grey darken-1'>
                <div className= 'card-content white-text'>
                <div id='profile'>
                  <p>Welcome, {this.userFirstName}!  </p>
                </div>
                <div id='quotes'>
                  <p><strong>Pending Requests:</strong></p>
                  <p>{this.userPendingRequests}</p>
                  <p><strong>Completed Requests:</strong></p>
                  <p>{this.userCompletedRequests}</p>
                </div>
              </div>
              </div>
              </div>
            </div>);
  }
}