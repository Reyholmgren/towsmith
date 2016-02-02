class Dashboard extends React.Component {
  constructor(props) {
    super(props);
    this.newRequest = this.newRequest.bind(this);
    this.state = { request: [], submitted: false };
  }
  componentWillMount(){
    $.ajax({
      url: '/requests',
      type: 'GET'
    }).success( data => {
      this.setState({ requests: data.requests });
    })
  }
  newRequest(){
    $.ajax({
      url: '/requests',
      type: 'POST',
      data: { request: {title: this.refs.title.value, info: this.refs.info.value } }
    }).success( data => {
      this.setState({submitted: true});
    }).error( data =>{
      console.log('error');
    });
  }
  confirmRequest(){
    $.ajax({
      url: '/requests',
      type:'POST',
      data: {request: {title: this.refs.newRequest.value}}
    }).success( data => {
      let request = this.state.request;
      request.unshift(data.request);
      this.refs.newRequest.value = null;
      this.setState({request: request});
    });
  }
  render() {
    if(this.state.submitted){
      return(<div>
               <h3>Request Successfully Submitted</h3>
               <br />
               <a href='/'>Dashboard</a>
               <a href='#' onClick={() => this.setState({submitted: false})}> New Request </a>
            </div>);
    } else {
      let request = this.state.request.map( request => {
        let key = `request-${request.title}`;
        return( <Request key={key} {...request} />);
      });
      return(
              <div className='container center'>
                <div className='row col s12 m8 offset-m2'>
                  <div id='profile'>
                    <p>Welcome,</p>
                  </div>
                  <div id='quotes'>
                    <h1><strong>Make A New Request</strong></h1>
                    <hr />
                    <p>{this.userRequest}</p>
                    <ul className="collapsible popout" data-collapsible="accordion">
                      <li>
                        <div className="collapsible-header"><i className="material-icons"></i>Tow Truck</div>
                        <div className="collapsible-body">
                          <form>
                            <input placeholder="Brief Description" ref='title' autoFocus={true} />  
                            <input placeholder="Make Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Model Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Year Of Car" ref='newRequest' autoFocus={false} />
                            <input type="checkbox" className="filled-in" id="ride" ref='newRequest' autoFocus={false} />
                            <label htmlFor="ride">Do You Need A Ride?</label>
                            <br />
                            <br />
                            <button className='btn' onClick={this.newRequest}>Next Step</button>
                          </form>
                        </div>
                      </li>
                      <li>
                        <div className="collapsible-header"><i className="material-icons"></i>Locksmith</div>
                        <div className="collapsible-body">
                          <form>
                            <input placeholder="Key Description(ie Manual, Transponder Chip, or Remote Control)" ref='newRequest' autoFocus={true} />  
                            <input placeholder="Make Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Model Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Year Of Car" ref='newRequest' autoFocus={false} />
                            <button className='btn' onClick={this.newRequest}>Next Step</button>
                          </form>
                        </div>
                      </li>
                      <li>
                        <div className="collapsible-header"><i className="material-icons"></i>Tow Truck & Locksmith</div>
                        <div className="collapsible-body">
                          <form>
                            <input placeholder="Why do you need a Tow?" ref='newRequest' autoFocus={true} /> 
                            <input placeholder="Key Description(ie Manual, Transponder Chip, or Remote Control)" ref='newRequest' autoFocus={false} />  
                            <input placeholder="Make Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Model Of Car" ref='newRequest' autoFocus={false} />
                            <input placeholder="Year Of Car" ref='newRequest' autoFocus={false} />
                            <input type="checkbox" className="filled-in" id="ride" ref='newRequest' autoFocus={false} />
                            <label htmlFor="ride">Do You Need A Ride?</label>
                            <br />
                            <br />
                            <button className='btn' onClick={this.newRequest}>Next Step</button>
                          </form>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>);
       }
  }

} 
