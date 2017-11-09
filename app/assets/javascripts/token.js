var getWebToken = function(username, password){
  return $.ajax({
    url: 'http://localhost:3000/api/v1/token',
    method: 'GET',
    data: { username: username, password = password }
  });
}
