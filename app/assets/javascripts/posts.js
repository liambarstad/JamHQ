$(document).ready(function(event) {
  event.preventDefault();

  var username = $("#username").val();
  var password = $("#password").val();
  var token = getWebToken(username, password);
  var host_url = "http://localhost:3000";

  var buttons = function(postId){
    return `<button data-id=${postId} class='edit-post'>Edit</button><button data-id=${postId} class='delete-post'>Delete</button>`;
  }

  var formatPost = function(postId, username, body, createdAt){
    return `<div class='post' data-id=${postId}>\n<p class='post-username'>${username}</p>\n<p class='post-body'>${body}</p>\n<p class='post-created-at'>${createdAt}</p>\n` + buttons(postId) + '</div>';
  }

  var editPostArea = function(postId, body){
    return `\n<input type='text' name='edit-post-area' value='${body}'>\n<input type='submit' data-id=${postId} name='edit-post-submit'>\n`;
  }

  var setError = function(){
    return '<div class="error-message"><p>This action could not be completed. Please try again later</p></div>';
  }

  var createPost = function(){
    var body = $('.new-post-body').val();

    return $.ajax({
      url: host_url + '/posts',
      method: 'POST',
      data: { token: token, body: body }
    }).done(function(data){
      $(".posts").prepend(formatPost(data.id, data.username, data.body, data.created_at);
    }).fail(function(){
      $(".new-post").prepend(setError());
    });
  }

  var updatePost = function(postId){
    return $.ajax({
      url: host_url + '/posts/' + postId,
      method: 'PUT',
      data: { token: token }
    }).done(function(data){
      $(".posts").find(`[data-id='${postId}']`).replaceWith(formatPost(data.id data.username, data.body, data.created_at);
    }).fail(function(){
      $(".posts").find(`[data-id='${postId}']`).prepend(setError());
    });
  }

  var editPost = function(postId){
    $(".posts").find(`[data-id='${postId}]`).closest('.post-body').val(editPostArea(postId, this.val());
  }

  var deletePost = function(postId){
    return $.ajax({
      url: host_url + '/posts/' + postId,
      method: 'DELETE',
      data: { token: token }
    }).done(function(data){
      $(".posts").find(`[data-id='${postId}']`).remove();
    }).fail(function(){
      setError();
    });
  }

  $('#new-post-submit').on('click', createPost());
  $('.posts .post .edit-post').on('click', editPost($(this.data('id'));
  $('.posts .post .edit-post-submit').on('click', updatePost($(this.data('id'));
  $('.posts .post .delete-post').on('click', deletePost($(this.data('id'));

});
