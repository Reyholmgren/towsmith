$(document).ready(function(){
  $("#provideraccept").click(function() {
    var requestId = $(this).data('request-id');
    var accepted = $(this).prop('checked');
    $.ajax({
      url: '/requests/' + requestId,
      type: 'PUT',
      dataType: 'JSON',
      data: {request: {accepted: accepted}},
      success: function(data) {
        console.log(data)
      },
      error: function() {
        alert('Error')
      }
    })
  });
  $("#providercompleted").click(function() {
    var requestId = $(this).data('request-id');
    var completed = $(this).prop('checked');
    $.ajax({
      url: '/requests/' + requestId,
      type: 'PUT',
      dataType: 'JSON',
      data: {request: {completed: completed}},
      success: function(data) {
        console.log(data)
      },
      error: function() {
        alert('Error')
      }
    })
  });
});