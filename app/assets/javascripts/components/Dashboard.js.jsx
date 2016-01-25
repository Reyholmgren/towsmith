class Dashboard extends React.Component {
  constructor(props) {
    super(props);
  }
  componentWillMount(){
    $.ajax({
      url: '/search',
      type: 'GET',
      dataType: 'JSON',
      data: { location: location }
    }).success( data => {
      this.refs.search.value = null;
      this.setState({ restaurants: data.restaurants });
    });
  }
  render() {
    return(
        <div>
          <h1 className='center'>TowSmith</h1>
            <div className='container'>
              <div className='row col s12 m8 offset-m2'>
                <div id='profile'>
                  <p>Company: </p>
                  <p>Phone: </p>
                  <p>Address: </p>
                  <p>Services: </p>
                </div>
                <div id='quotes'>
                  <p>Pending Requests</p>
                  <p>Completed Requests</p>
                </div>
              </div>
            </div>
          </div>);
  }
}